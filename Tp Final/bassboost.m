%Aca cargamos los parametros de inicializacion
G=1;%Factor de ganancia
wc1 = 130;%F de crossover
wc2 = 20;%F de rango del oido
orden_f = 1024;%orden de los filtros
fover = 4;%Factor de interpolacion
op=4; %opcion de hardclipping
%No es necesario hacer compensacion de delay ya que fir1 compensa internamente

%En primera instancia cargamos el archivo

[original,Fm,bps] = wavread("original.wav");

%Dividimos los canales

c_left = original(:,1);
c_right = original(:,2);

%Creamos los filtros pasa altos y pasa altos necesarios

%Primero calculamos la frecuencia de corte

%Fecuencia de corte para los filtros en el crossover
omegad1 = wc1/(Fm/2);

%Filtros para los canales limpios
hpfl = fir1(orden_f,omegad1,"high","blackman");
hpfr = fir1(orden_f,omegad1,"high","blackman");


%Desarrollo del sistema

%CANALES ORIGINALES

%Filtramos la señal original para eliminar la parte del espectro que no vamos a procesar
co_left = filter(hpfl,1,c_left);
co_right = filter(hpfr,1,c_right);


f=abs(fft(co_left));
plot(f(1:Fm/2));

f=abs(fft(co_left));
plot(f);

%CANAL PARALELO

%Sobremuestreamos la señal con un factor de 4 veces
cs_left = upsample(c_left,fover);
cs_right = upsample(c_right,fover);

%Hacemos monofonica la señal paralela
pmono_1 = cs_left+cs_right;

%Filtros para el canal paralelo
%Fecuencia de corte para los filtros en el crossover
omegad1 = wc1/(Fm*fover/2);

%Frecuencia de corte para aislar las frecuencias que escucha el oido humano - 20hz es la mas baja
omegad2 = wc2/(Fm*fover/2);

hpfp = fir1(orden_f,omegad2,"high","blackman");
lpfp = fir1(orden_f,omegad1,"low","blackman");

%Filtramos para quedarnos con el espectro audible
pmono_2 = filter(hpfp,1,pmono_1);

%Aplicamos el NLD

pmono_3 = softclipping(op,pmono_2);

%Filtramos para eliminar armonicos en la frecuencia de crossover
pmono_4 = filter(lpfp,1,pmono_3);

%Normalizamos la ganancia
pmono_5 = G*pmono_4;

%Submuestreamos la señal
pmono_6 = downsample(pmono_5,fover);




%SALIDA SUMADA

s_left = co_left + pmono_6';
s_right = co_right + pmono_6';

%Podriamos volver a compensar para que la señal quede en 0

%La cantidad de muestras total corridas son justo igual que el orden de los filtros porque hay 2 filtros en 
%la linea del sistema con mas delay, esta es el canal paralelo

fin_left = s_left(orden_f:end);
fin_right = s_right(orden_f:end);

wavwrite([fin_left,fin_right],Fm,bps,"Procesado");








