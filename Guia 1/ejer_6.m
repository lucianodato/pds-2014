%Inicializacion de parametros

t_ini = 0;
t_fin = 1;
Fm = 10;
fs = 0.5;
fase = 0;
A = 1;

%Senoidal 1
[t,s] = senoidal(Fm,fs,fase,t_ini,t_fin,A);
subplot(2,1,1);
stem(t,s,'k');

% Interpolamos la funcion original
% 1 es escalon
% 2 es lineal
% 3 es sinc
% tasa es la cantidad de veces que voy a aumentar el muestreo
% interpolador(t,s,opcion,tasa)

[tn,sn] = interpolador(t,s,1,4);
subplot(2,1,2);
stem(tn,sn,'k');
