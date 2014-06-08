clc
clear all
close all
%Aca cargamos los parametros de inicializacion
G=1;%Factor de ganancia
wc1 = 130;%F de crossover
wc2 = 16;%F de rango del oido
orden_f = 5000;%orden de los filtros
fover = 4;%Factor de interpolacion
op=1; %opcion de hardclipping
%No es necesario hacer compensacion de delay ya que fir1 compensa internamente

%En primera instancia cargamos el archivo

[original,Fm,bps] = wavread('original.wav');

%Dividimos los canales
c_left = original(:,1);
c_right = original(:,2);

%Creamos los filtros pasa altos y pasa altos necesarios

%Primero calculamos la frecuencia de corte

%Frecuencia de corte para los filtros en el crossover
omegad1 = wc1/(Fm/2);
%Filtros para los canales limpios
b_hpf = fir1(orden_f,omegad1,'high',hamming(orden_f+1));

% %Desarrollo del sistema
% % filtrado de CANALES ORIGINALES
% %Filtramos la seÃ±al original para que quede la señal con la frecuancias
% mayores a wc1, las frecuancias menores a wc1 son las que vamos a
% modificar para lograr el efecto de mejora de bajos
%HPF1 y HPF2
 co_left = filter(b_hpf,1,c_left);
 co_right = filter(b_hpf,1,c_right);
 
 
% %CANAL PARALELO
% dejamos el por el momento los canales exteriores asi y
% tomamos de nuevo la señal original
 %Sobremuestreamos la seÃ±al con un factor de 4 veces
% cs_left = upsample(c_left,fover);
% cs_right = upsample(c_right,fover);
%aumento 4 veces el muestreo de la señal

%mono
suma=c_left+c_right; %hago mono derecho con la señales l y r ofiginales
pmono_1=suma./max(suma); %normalizo... esto lo puedo sacar

%Upsampling  --- lo saque para testear como suena asi.
%para test con up y down descomentar esto y cambiar pmono5 , por pmono6
% y NuevaFrec poner en x 4
%NOTA: uso esta forma de Upsampling xq la funcion "Upsampling" no terminaba
%mas en matlab, aca va bien
            % Tm1 = fft(c_left);
            % N = length(c_left);
            % X = [Tm1(1:N/2); zeros((fover-1)*N,1); Tm1(N/2+1:N);];
            % cs_left = real(ifft(X)).*fover;%el 4 es xq al aumentar el numero de puntos , la mag de los palitos se va ver reducido a la mitad
            % 

            % Tm1 = fft(c_right);
            % N = length(c_right);
            % X = [Tm1(1:N/2); zeros((fover-1)*N,1); Tm1(N/2+1:N);];
            % cs_right = real(ifft(X)).*fover;%el 4 es xq al aumentar el numero de puntos , la mag de los palitos se va ver reducido a la mitad


% 
% %Hacemos monofonica la seÃ±al paralela
%NOTA: segun el dibujo del pdf "tp" abria que hacerla mono antes del
%upsampling
% pmono_1 = real(cs_left)+real(cs_right);

% %Como interpole, aumente el numero de puntos, por lo tanto la fm de mi señal cambio
% % y debo diseñar de nuevo al filtro con los nuevos parametros de diseño
% % %Filtros para el canal paralelo
% % %Frecuencia de corte para los filtros en el crossover
 NuevaFrec=Fm*1;

% % 
% % %Frecuencia de corte para aislar las frecuencias que escucha el oido humano - 20hz es la mas baja
 omegad2_n = wc2/(NuevaFrec/2);
% % filtro pasa alto de 20 hz
 hpfp = fir1(orden_f,omegad2_n,'high',hamming(orden_f+1));

% % 
% % Limpiamos todo por debajo de 20Hz
 pmono_2 = filter(hpfp,1,pmono_1);
 
% %Aplicamos el NLD
% 

  pmono_3 = softclipping(op,pmono_2);

% % 
% % %Filtramos para eliminar armonicos en la frecuencia de crossover
% %Ejemplo 130Hz
  omegad1_n = wc1/(NuevaFrec/2);
  lpfp = fir1(orden_f,omegad1_n,'low',hamming(orden_f+1));
  pmono_4 = filter(lpfp,1,pmono_3);
%  
  plot(abs(fft(pmono_4)))
  soundsc(pmono_4)
% 
% %Normalizamos la ganancia
 pmono_5 = G*pmono_4;
% 
% %Submuestreamos la seÃ±al
 %pmono_6 = downsample(pmono_5,fover);
% %SALIDA SUMADA

 s_left = co_left + real(pmono_5);
 s_right = co_right + real(pmono_5);

 s_left=s_left./max(s_left);
 s_right=s_right./max(s_right);
 wavwrite([s_left,s_right],Fm,bps,'Procesado');








