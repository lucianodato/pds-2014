%Ejercicio 4

Fm = 100;
T = 1/Fm;
t_ini = 0;
t_fin = 1;
t = t_ini:T:t_fin-T; 
N = length(t);
df=Fm/N;
freq=-Fm/2:df:Fm/2-df;

%Sitema Lineal


y1(1) = 0; %Esto seria y(0)=0 Pero pongo 1 porque no permite octave indices 0
for i = 2:N
	y1(i) = 5*t(i) + 2*y1(i-1);
endfor

%Sistema No Lineal

 
w=2*pi*10;%frecuencia 10
for i = 2:N
	y2(i) = sin(w*i)*t(i-1);
endfor

fy1 = fftp(y1);
fy2 = fftp(y2);

subplot(2,2,1);
plot(y1);
subplot(2,2,2);
plot(freq,fy1);
subplot(2,2,3);
plot(y2);
subplot(2,2,4);
plot(freq,fy2);


