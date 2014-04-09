%Ejercicio 5

%Modelar el impulso y transformarlo con fft para ver el espectro

Fm=100;
T = 1/Fm;
t_ini = 0;
t_fin = 1;
t=t_ini:T:t_fin-T;
N=length(t);
df= Fm/N;
freq = -Fm/2:df:Fm/2-df;

%Sin ventana o ventana rectangular?
s1=impulso(t);

subplot(3,1,1);
plot(t,s1);

fs1=fftp(s1);

subplot(3,1,2);
plot(freq,fs1);

%Usando hanning
cant_ventanas=4;
tam_vent=N/cant_ventanas;
w = hanning(tam_vent);
w = transpose(w); %lo transpongo para que este en el mismo sentido que el resto
%Tengo que tomar cada tramo de la funcion y multiplicarlo por la ventana
%Paso la ventana por la funcion
s2 = zeros(1,N);
comienzo = 1;
fin = tam_vent;

for i=1:cant_ventanas
	s2(comienzo:fin) = s1(comienzo:fin).*w(1:tam_vent);
	comienzo = fin;
	fin = fin + tam_vent-1;
endfor

fs2 = fftp(s2);
subplot(3,1,3);
plot(freq,fs2);


