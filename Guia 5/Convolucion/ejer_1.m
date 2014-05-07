% Elegimos de señal periodica un seno

Fm = 100;
N=1/Fm;
t_ini=0;
t_fin=6;
t=t_ini:N:t_fin-N;
fs=10;

s = sin(2*pi*t*fs);
%Sistema de la pagina 127
x= [1 2 2];
y= [2 5 6.5 3 1];
[h,r]= deconv(y,x);

c = conv(s,h);

figure(1);
subplot(2,1,1);
plot(s);
subplot(2,1,2);
plot(h);
figure(2);
plot(c); 

%Mostramos que c tiene el mismo periodo que t es decir que N = T
T=1/length(c);
if (T == N)
	disp("Los periodos son iguales");
endif
