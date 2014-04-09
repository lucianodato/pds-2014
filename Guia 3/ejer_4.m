%Ejercicio 4
Fm = 100;
t_ini = 0;
t_fin = 1;
T=1/Fm;
t=t_ini:T:t_fin-T;
t2=t_ini:T:2*t_fin-T;
N = length(t);
N2 = length(t2);
df= Fm/N2;
freq = -Fm/2:df:Fm/2;

s1=sin(2*pi*4*t);
s1(N+1:N2)= zeros(1,N);


fs1 = fftp(s1);
fs1a= fft(s1);
% A modifico agregando un retardo de 10 muestras y la antitransformo
%una pendiente que genere un retardo de 10 muestras (uso la propiedad de retardo de la fft)
%hay que tener en cuenta que t tiene el doble de su tamaño por lo tanto tambien el k
k=0:N2-1;
fs1a = fs1a.*exp((-j*2*pi*k*10)/N2);
s2=ifft(fs1a);

subplot(2,2,1);
plot(t2,s1);
subplot(2,2,2);
plot(freq,fs1);



subplot(2,2,3);
plot(t2,s2);

% B Genero la misma señal pero la retardo en el dominio del tiempo
s3=sin(2*pi*4*t);
s3(N+1:N2)= zeros(1,N);

%retardo
n=1:N2;
s3 = s3.*exp((-j*2*pi*n*10)/N2);

fs3 = fftp(s3);

subplot(2,2,4);
plot(freq,fs3);

