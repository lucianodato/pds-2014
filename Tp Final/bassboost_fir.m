%----------CONFIGURACION----------

nombre_archivo = "Original.wav";%nombre del archivo a procesar

wc1 = 100;%F del tipo 1
wc2 = 20;%F del tipo 2
wc3 = 100;%F del tipo 3
tipo1 = "high";% high / low / bandpass
tipo2 = "high";
tipo3 = "low";

%FIR
orden_f = 48;%orden de los filtros
tipo_ventana = "blackman";%Tipo de ventana para los filtros

over = 0;% 0 - Sin remuestreo / 1 - Con Remuestreo
fover = 4;%Factor de remuestreo

op = 3;%opcion de softclipping (1-TSQ / 2-EXP5 / 3-Sinusoidal / 4-James Johnston)
K = 2.5;%factor de distorsion del metodo de James Johnston (Entre 1 y 5)

M = 0.5;%Factor de mezcla canal paralelo (Entre 0 y 1)
ceil_norm = 0.95;%techo de normalizado para evitar clipping

N = 4096;%Ventana para las graficas de respuesta de frecuencias de los filtros (512/1024/4096)

%---------------------------------









%----------INICIALIZACION----------

%En primera instancia cargamos el archivo

[original,Fm,bps] = wavread(nombre_archivo);

f_nyquist = Fm/2;
delay_f = orden_f/2;

%Dividimos los canales

e_left = original(:,1);
e_right = original(:,2);

%--->Configuracion de Filtros<---

%Fecuencia de corte para los filtros pasa altos de la señal directa (normalizacion)
omega1 = wc1/f_nyquist;

%Frecuencia de corte para aislar las frecuencias que escucha el oido humano - 20hz es la mas baja (normalizacion)
omega2 = wc2/f_nyquist;

%Frecuencia de corte para el pasa bajos que limpia armonicos no deseados (normalizacion)
omega3 = wc3/f_nyquist;

%FIR
%Filtros para los canales limpios
hpfdb = fir1(orden_f,omega1,tipo1,tipo_ventana);

%Filtros para el canal paralelo
hpfpb = fir1(orden_f,omega2,tipo2,tipo_ventana);
lpfpb = fir1(orden_f,omega3,tipo3,tipo_ventana);

#%FIR 2
#%Filtros para los canales limpios
#f1 = [0 omega1 omega1 1];
#m1 = [0 0 1 1];
#hpfdb = remez(orden_f,f1,m1);

#%Filtros para el canal paralelo
#f2 = [0 omega2 omega2 1];
#m2 = [0 0 1 1];
#hpfpb = remez(orden_f,f2,m2);
#f3 = [0 omega3 omega3 1];
#m3 = [1 1 0 0];
#lpfpb = remez(orden_f,f3,m3);

#%-------------Desarrollo del sistema--------------

#% --(L)--|----------------(HPF)-------------------(+)--(L)--
#%        |                                         |
#%       (+)--(HPF)--(US)--(NLD)--(DS)--(LPF)--(G)--|
#%        |                                         |
#% --(R)--|----------------(HPF)-------------------(+)--(R)--


#%-------------CANALES ORIGINALES---------

#%Agrego ceros a la señal de entrada para no perder muestras al filtrar
#ec_left = [e_left;zeros(delay_f,1)];
#ec_right = [e_right;zeros(delay_f,1)];

#%Filtramos la señal original para eliminar la parte del espectro que no vamos a procesar
#ef_left = fftfilt(hpfdb,ec_left);
#ef_right = fftfilt(hpfdb,ec_right);

#%Elimino los ceros al comienzo
#ef_left = ef_left(delay_f+1:end);
#ef_right = ef_right(delay_f+1:end);

#wavwrite([ef_left,ef_right],Fm,bps,"Canal directo filtrado");

#%-------------CANAL PARALELO-------------

#%Agrego ceros a la señal de entrada para no perder muestras al filtrar (agrego mas ceros porque hay 2 filtros)
#ec_left = [ec_left;zeros(delay_f,1)];
#ec_right = [ec_right;zeros(delay_f,1)];

#%Generamos la señal monofonica paralela
#pmono = ec_left+ec_right;

#%Filtramos la señal paralela para quedarnos con el espectro audible
#pmono = fftfilt(hpfpb,pmono);

#%Sobremuestreamos la señal con un factor de 4 veces
#if(over == 1)
#	pmono = upsample(pmono,fover);
#endif

#%Aplicamos el NLD
#pmono = softclipping(op,K,pmono);

#%Submuestreamos la señal
#if(over == 1)
#	pmono = decimate(pmono,fover,"fir");%Es mejor que downsample porque filtra el aliasing
#endif

#%Filtramos para eliminar armonicos en la frecuencias superiores de crossover
#pmono = fftfilt(lpfpb,pmono);

#%Normalizamos la ganancia

#pmono = M .* ceil_norm/max(pmono) .* pmono;

#%Elimino los ceros al comienzo
#pmono = pmono(2*delay_f+1:end);

#wavwrite(pmono,Fm,bps,"Canal paralelo procesado");

#%-------------SALIDA SUMADA-------------

#%Volvemos a reconstruir la señal
#s_left = ef_left + pmono';
#s_right = ef_right + pmono';

#%Normalizo la señal de salida para evitar clipping (segun la que tenga mayor amplitud)
#norl = abs(max(s_left ));
#norr = abs(max(s_right ));

#if(norl < norr)
#	s_left = s_left * ceil_norm/norr;
#	s_right = s_right * ceil_norm/norr;
#else
#	s_left = s_left * ceil_norm/norl;
#	s_right = s_right * ceil_norm/norl;
#endif

#%Escribimos el archivo procesado
#wavwrite([s_left,s_right],Fm,bps,"Procesado");

%----------->Pruebas<-----------

figure(1,"name","Canal Directo - Filtrado")
freqz(hpfdb,1,N,0,Fm);

figure(2,"name","Canal Paralelo - Filtro Pasa Bajos")
freqz(hpfpb,1,N,0,Fm);

figure(3,"name","Canal Paralelo - Filtro Pasa Altos")
freqz(lpfpb,1,N,0,Fm); 

#figure(4,"name","Canal Directo - Respuesta Filtrada")
#fd=abs(fft(ef_left));
#plot(mag2db(fd(1:Fm/2)));

#figure(5,"name","Canal Paralelo - Respuesta filtrada y procesada")
#fp=abs(fft(pmono));
#plot(mag2db(fp(1:Fm/2)));

#figure(6,"name","Resultado Final")
#ff=abs(fft(s_left+s_right));
#plot([1:Fm/2],mag2db(ff(1:Fm/2)));

%TODO
%Arreglar los filtros fir para que la respuesta sea precisa







