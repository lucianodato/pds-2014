%Inicializacion de parametros

t_ini = 0;
t_fin = 2;
Fm = 129;
fs = 4000;
fase = 0;
A = 1;

%Senoidal 1
[t,s] = senoidal(Fm,fs,fase,t_ini,t_fin,A);
plot(t,s,'k');
