%Ejercicio 10
Fm=360;
T=1/Fm;
s = load("necg.txt");
N=length(s);
df=Fm/N;
freq = -Fm/2:df:Fm/2;

subplot(3,1,1);
plot(s);

fs1 = fftp(s);

subplot(3,1,2);
plot(freq,fs1);

%debo eliminar el ruido en la banda de 40 a 180 en amplitud -- Y LA FASE???
%para hacerlo correctamente puedo calcular los intervalos
% N=1024 muestras
%Haciendo regla de 3 simples 
%1024 es  360 hz
%114  es   40 hz
%512  es  180 hz
%Ahora teniendo en cuenta que la parte negativa es espejo de la positiva
%512 es el centro o frecuencia 0 por lo tanto 512+512 seria +180hz y 512+114 seria +40hz
%Ahora para la parte negativa 512-512 seria +180hz y 512-114 seria +40hz

fs2=fs1;

fs2(1:398) = 0;
fs2(512+114:1024) = 0;

subplot(3,1,3);
plot(freq,fs2);


