%Declaramos las funciones
Fs=10000;
t_ini = 0;
t_fin = 1;
T=1/Fs;
t=t_ini:T:t_fin-T;
N=length(t);
#df=Fs/N;
#freq=-Fs/2:df:Fs/2-df;
%Para poder mostrar la respuesta en frecuencia de cada uno de los H(z) calculados lo unico que hace falta es
%definir el a y b para pasarle a la funcion freqz

%Para el 1

a = [0 0.25 -0.5 1];
b = [0 0 0 1];
a = a(end:-1:1);
b = b(end:-1:1);
figure(1);
[h1,f1] = freqz(b,a,N,0,Fs);
#subplot(2,1,1);
#plot(f1,abs(h1));%Frecuencia
#subplot(2,1,2);
#plot(f1,angle(h1));%Fase
freqz_plot(f1,h1);


%Para el 2

a = [0 -1 -1 1];
b = [0 0 1];
a = a(end:-1:1);
b = b(end:-1:1);

figure(2);
[h2,f2] = freqz(b,a,N,0,Fs);
freqz_plot(f2,h2);

%Para el 3

a = [0 6 -2 1];
b = [0 0 0 7];
a = a(end:-1:1);
b = b(end:-1:1);

figure(3);
[h3,f3] = freqz(b,a,N,0,Fs);
freqz_plot(f3,h3);

%Para el 4

a = [0 0 0 0 0 0 0 0 1];
b = [1/128 1/64 1/32 1/16 1/8 1/4 1/2 1];
a = a(end:-1:1);
b = b(end:-1:1);

figure(4);
[h4,f4] = freqz(b,a,N,0,Fs);
freqz_plot(f4,h4);



