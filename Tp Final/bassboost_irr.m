%----------CONFIGURACION----------

nombre_archivo = "Original.wav";%nombre del archivo a procesar

wc1 = 130;%F del tipo 1
wc2 = 20;%F del tipo 2
wc3 = 130;%F del tipo 3
tipo1 = 'high';% high / low / bandpass
tipo2 = 'high';
tipo3 = 'low';

%IIR
orden_i = 4;

over = 0;% 0 - Sin remuestreo / 1 - Con Remuestreo
fover = 4;%Factor de remuestreo

op = 4;%opcion de softclipping (1-TSQ / 2-EXP5 / 3-Sinusoidal / 4-James Johnston)
K = 2.5;%factor de distorsion del metodo de James Johnston (Entre 1 y 5)

M = 1;%Factor de mezcla canal paralelo (Entre 0 y 2 / 1 y 3 para James Johnson)
ceil_norm = 0.95;%techo de normalizado para evitar clipping

N = 4096;%Ventana para las graficas de respuesta de frecuencias de los filtros (512/1024/4096)

%---------------------------------









%----------INICIALIZACION----------

%En primera instancia cargamos el archivo

[original,Fm,bps] = wavread(nombre_archivo);

f_nyquist = Fm/2;

%Dividimos los canales (comprobando si la señal original es monofonica)
tam = size(original);

if (tam(2) > 1)
	e_left = original(:,1);
	e_right = original(:,2);
else
	e_mono = original(:,1);
endif

%--->Configuracion de Filtros<---

%Fecuencia de corte para los filtros pasa altos de la señal directa (normalizacion)
omega1 = wc1/f_nyquist;

%Frecuencia de corte para aislar las frecuencias que escucha el oido humano - 20hz es la mas baja (normalizacion)
omega2 = wc2/f_nyquist;

%Frecuencia de corte para el pasa bajos que limpia armonicos no deseados (normalizacion)
omega3 = wc3/f_nyquist;

%IIR
%Filtros para los canales limpios
[hpfdb,hpfda] = butter(orden_i,omega1,tipo1);

%Filtros para el canal paralelo
[hpfpb,hpfpa] = butter(orden_i,omega2,tipo2);
[lpfpb,lpfpa] = butter(orden_i,omega3,tipo3);


%-------------Desarrollo del sistema--------------

% --(L)--|----------------(HPF)-------------------(+)--(L)--
%        |                                         |
%       (+)--(HPF)--(US)--(NLD)--(DS)--(LPF)--(G)--|
%        |                                         |
% --(R)--|----------------(HPF)-------------------(+)--(R)--


%-------------CANALES ORIGINALES---------

%Filtramos la señal original para eliminar la parte del espectro que no vamos a procesar (crossover)
if (tam(2) > 1)
	ef_left = filter(hpfdb,hpfda,e_left);
	ef_right = filter(hpfdb,hpfda,e_right);
else
	ef_mono = filter(hpfdb,hpfda,e_mono);
endif

%if (tam(2) > 1)
%	wavwrite([ef_left,ef_right],Fm,bps,"Canal directo filtrado");
%else
%	wavwrite(ef_mono,Fm,bps,"Canal directo filtrado");
%endif

%-------------CANAL PARALELO-------------

%Generamos la señal monofonica paralela
if (tam(2) > 1)
	pmono = e_left+e_right;
else
	pmono = e_mono;
endif

%Filtramos la señal paralela para quedarnos con el espectro audible
pmono = filter(hpfpb,hpfpa,pmono);

%Sobremuestreamos la señal con un factor de 4 veces (si esta activada la opcion)
if(over == 1)
	pmono = upsample(pmono,fover);
endif

%Aplicamos el NLD
pmono = softclipping(op,K,pmono);

%Submuestreamos la señal (si esta activada la opcion)
if(over == 1)
	pmono = decimate(pmono,fover,"fir");%Es mejor que downsample porque filtra el aliasing
endif

%Filtramos para eliminar armonicos en la frecuencias superiores al crossover
pmono = filter(lpfpb,lpfpa,pmono);

%Normalizamos la ganancia
pmono = M .* ceil_norm/max(pmono) .* pmono;

%wavwrite(pmono,Fm,bps,"Canal paralelo procesado");

%-------------SALIDA SUMADA-------------

%Procedemos segun la señal sea mono o stereo
if (tam(2) > 1)
	%Volvemos a reconstruir la señal
	s_left = ef_left + pmono';
	s_right = ef_right + pmono';

	%Normalizo la señal de salida para evitar clipping (segun la que tenga mayor amplitud)
	norl = abs(max(s_left));
	norr = abs(max(s_right));

	if(norl < norr)
		s_left = s_left * ceil_norm/norr;
		s_right = s_right * ceil_norm/norr;
	else
		s_left = s_left * ceil_norm/norl;
		s_right = s_right * ceil_norm/norl;
	endif
else
	%Volvemos a reconstruir la señal
	s_mono = ef_mono + pmono';

	%Normalizo la señal de salida para evitar clipping (segun la que tenga mayor amplitud)
	normm = abs(max(s_mono));
	s_mono = s_mono * ceil_norm/normm;
endif

%Escribimos el archivo procesado (segun se a mono o stereo el original)
if (tam(2) > 1)
	wavwrite([s_left,s_right],Fm,bps,"Procesado");
else
	wavwrite(s_mono,Fm,bps,"Procesado");
endif

%----------->Pruebas<-----------

#figure(1,"name","Canal Directo - Filtrado")
#freqz(hpfdb,hpfda,N,0,Fm);

#figure(2,"name","Canal Paralelo - Filtro Pasa Bajos")
#freqz(hpfpb,hpfpa,N,0,Fm);

#figure(3,"name","Canal Paralelo - Filtro Pasa Altos")
#freqz(lpfpb,lpfpa,N,0,Fm); 

#figure(4,"name","Canal Directo - Respuesta Filtrada")
#fd=abs(fft(ef_left));
#plot(mag2db(fd(1:Fm/2)));

#figure(5,"name","Canal Paralelo - Respuesta filtrada y procesada")
#fp=abs(fft(pmono));
#plot(mag2db(fp(1:Fm/2)));

#figure(6,"name","Resultado Final")
#ff=abs(fft(s_left+s_right));
#plot(mag2db(ff(1:Fm/2)));







