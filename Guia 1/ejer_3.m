%Inicializacion de parametros

t_ini = 0;
t_fin = 0.1;
% si en 0.1 segundos entran 80 muestras la Fm en 1 segundos es 800 hz
Fm = 800;
%dos periodos entran en 0.1 segundos entonces la senoidal es de 20 hz
fs = 20;
%calculo la fase a travez de la inversa del 0
fase = -2*pi*fs*0.0055;
A = 3;

%Senoidal 1
[t,s] = senoidal(Fm,fs,fase,t_ini,t_fin,A);
stem(t,s,'k');
