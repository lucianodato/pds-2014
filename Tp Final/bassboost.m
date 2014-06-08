%----------CONFIGURACION----------

nombre_archivo = "original.wav";%nombre del archivo a procesar

wc1 = 200;%F de pasa altos canales directos
wc2 = 20;%F de limpieza (rango del oido)
wc3 = 200;%F de pasa bajos (limpieza de armonicos)
orden_f = 64;%orden de los filtros
tipo_ventana = "blackman";%Tipo de ventana para los filtros

over = 0;% 0 - Sin remuestreo / 1 - Con Remuestreo
fover = 4;%Factor de remuestreo

op = 4;%opcion de softclipping (1-TSQ / 2-EXP5 / 3-Sinusoidal / 4-James Johnston)
K = 2.5;%factor de distorsion del metodo de James Johnston

M = 0.8;%Factor de mezcla canal paralelo (Entre 0.1 y 0.3 de 1 a 3 / 0.9 para James Johnson)
ceil_norm = 0.95;%techo de normalizado para evitar clipping

N = 1024;%Ventana para las graficas de respuesta de frecuencias de los filtros (512/1024/4096)

%---------------------------------









%----------INICIALIZACION----------

%En primera instancia cargamos el archivo

[original,Fm,bps] = wavread(nombre_archivo);

%Dividimos los canales

e_left = original(:,1);
e_right = original(:,2);

%Tomo la referencia de la amplitud maxima
gmax = abs(max(e_left + e_right));

%--->Configuracion de Filtros<---

%Fecuencia de corte para los filtros pasa altos de la señal directa (normalizacion)
omega1 = wc1/(Fm/2);

%Frecuencia de corte para aislar las frecuencias que escucha el oido humano - 20hz es la mas baja (normalizacion)
omega2 = wc2/(Fm/2);

%Frecuencia de corte para el pasa bajos que limpia armonicos no deseados (normalizacion)
omega3 = wc3/(Fm/2);

%Filtros para los canales limpios
hpfd = fir1(orden_f,omega1,"high",tipo_ventana);

%Filtros para el canal paralelo
hpfp = fir1(orden_f,omega2,"high",tipo_ventana);
lpfp = fir1(orden_f,omega3,"low",tipo_ventana);



%-------------Desarrollo del sistema--------------

% --(L)--|----------------(HPF)-------------------(+)--(L)--
%        |                                         |
%       (+)--(HPF)--(US)--(NLD)--(DS)--(HPF)--(G)--|
%        |                                         |
% --(R)--|----------------(HPF)-------------------(+)--(R)--


%-------------CANALES ORIGINALES---------

%Filtramos la señal original para eliminar la parte del espectro que no vamos a procesar
%ef_left = filter(hpfl,1,e_left);
%ef_right = filter(hpfr,1,e_right);
ef_left = fftfilt(hpfd,e_left);%mas rapido que en el dominio temporal
ef_right = fftfilt(hpfd,e_right);

wavwrite([ef_left,ef_right],Fm,bps,"Canal directo filtrado");

#%----------->Pruebas
#figure(1,"name","Canal Directo - Filtrado")
#freqz(hpfl,1,N,Fm);

#figure(2,"name","Canal Directo - Respuesta Filtrada")
#fd=abs(fft(ef_left));
#plot(mag2db(fd(1:Fm/2)));

%-------------CANAL PARALELO-------------

%Generamos la señal monofonica paralela
pmono = e_left+e_right;

%Filtramos la señal paralela para quedarnos con el espectro audible
pmono = filter(hpfp,1,pmono);

%Sobremuestreamos la señal con un factor de 4 veces
if(over == 1)
	pmono = upsample(pmono,fover);
endif

%Aplicamos el NLD
pmono = softclipping(op,K,pmono);

%Submuestreamos la señal
if(over == 1)
	%pmono = downsample(pmono,fover);
	pmono = decimate(pmono,fover,"fir");%Es mejor que downsample porque filtra el aliasing
endif

%Filtramos para eliminar armonicos en la frecuencias superiores de crossover
%pmono = filter(lpfp,1,pmono);
pmono = fftfilt(lpfp,pmono);%mas rapido que en el dominio temporal

%Normalizamos la ganancia
pmono = M .* pmono;

wavwrite(pmono,Fm,bps,"Canal paralelo procesado");

#%----------->Pruebas
#figure(3,"name","Canal Paralelo - Filtro Pasa Bajos")
#freqz(hpfp,1,N,Fm);

#figure(4,"name","Canal Paralelo - Filtro Pasa Altos")
#freqz(lpfp,1,N,Fm); 

#figure(5,"name","Canal Paralelo - Respuesta filtrada y procesada")
#fp=abs(fft(pmono));
#plot(mag2db(fp(1:Fm/2)));

%-------------SALIDA SUMADA-------------

%Volvemos a reconstruir la señal
s_left = ef_left + pmono';
s_right = ef_right + pmono';

%Normalizo la señal de salida para evitar clipping (segun la que tenga mayor amplitud)
norl = abs(max(s_left ));
norr = abs(max(s_right ));

if(norl < norr)
	s_left = s_left * ceil_norm/norr;
	s_right = s_right * ceil_norm/norr;
else
	s_left = s_left * ceil_norm/norl;
	s_right = s_right * ceil_norm/norl;
endif

%Escribimos el archivo procesado
wavwrite([s_left,s_right],Fm,bps,"Procesado");

#%----------->Pruebas
#figure(6,"name","Resultado Final")
#ff=abs(fft(s_left+s_right));
#plot([1:Fm/2],mag2db(ff(1:Fm/2)));







