%Ejercicio 7

%A-señal*(Fm/2)

%256=4*Fm/2 --->Fm=128
%64=1*Fm/2 ---->Fm=128 --- OK!

%La funcion tiene aliasing por lo tanto hay que tener en cuenta que las frecuencias podrian estar espejadas
%nyquist es 64 hz

%Ninguno de los T corresponde a la frecuencia para la frecuencia de muestreo


#Fm=128;
#T = 1/Fm;%--> No coincide con ninguno
#t_ini = 0;
#t_fin = 1;
#t=t_ini:T:t_fin-T;
#N=length(t);
#df= Fm/N;
#freq = -Fm/2:df:Fm/2;

#s = sin(2*pi*f1*t) + 4*sin(2*pi*f2*t);

#subplot(2,1,1);
#plot(s);

#fs = fftp(s);

#subplot(2,1,2);
#plot(freq,fs);



