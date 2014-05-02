%Ejercicio 8
Fm = 50;
t_ini = 0;
t_fin = 1;
T=1/Fm;
t=t_ini:T:t_fin-T;
N = length(t);
df= Fm/N;
freq = -Fm/2:df:Fm/2-df;

% A

s1=2*sin(2*pi*27*t);

subplot(3,2,1);
plot(t,s1);

fs1 = fftp(s1);

subplot(3,2,2);
plot(freq,fs1);

%La frecuencia que observo es 23 comparado con 27 de la original
%Si la frecuencia de nyquist (Fm/2) es 25 y 27 se pasa por 2 entonces se refleja para el lado contrario es 
%el effecto mirroring producido por el alias

% B Una formula para poder representar frecuencias y tener en cuenta que no se cumple nyquist puede ser
% freq = fm/2 - (fs - floor(2*fs/fm)*fm)
%Compruebo 

s2=2*sin(2*pi*105*t);

subplot(3,2,3);
plot(t,s2);

fs2 = fftp(s2);

subplot(3,2,4);
plot(freq,fs2);

%Con una frecuencia de 105 hz 

% C Y la amplitud?
% Una formula podria ser A-señal*(Fm/2)

s3=sin(2*pi*105*t);

subplot(3,2,5);
plot(t,s3);

fs3 = fftp(s3);

subplot(3,2,6);
plot(freq,fs3);
