%Inicializacion de parametros

t_ini = 0;
t_fin = 1;
Fm1 = 100;
Fm2 = 25;
Fm3 = 10;
Fm4 = 4;
Fm5 = 1;
Fm6 = 0.5;
fs = 5;
fase = 0;
A = 1;

%Senoidal 1
[t,s] = senoidal(Fm1,fs,fase,t_ini,t_fin,A);
subplot(6,1,1);
plot(t,s,'k');

%Senoidal 2
[t,s] = senoidal(Fm2,fs,fase,t_ini,t_fin,A);
subplot(6,1,2);
plot(t,s,'k');

%Senoidal 3
[t,s] = senoidal(Fm3,fs,fase,t_ini,t_fin,A);
subplot(6,1,3);
plot(t,s,'k');

%Senoidal 4
[t,s] = senoidal(Fm4,fs,fase,t_ini,t_fin,A);
subplot(6,1,4);
plot(t,s,'k');

%Senoidal 5
[t,s] = senoidal(Fm5,fs,fase,t_ini,t_fin,A);
subplot(6,1,5);
plot(t,s,'k');

%Senoidal 6
[t,s] = senoidal(Fm6,fs,fase,t_ini,t_fin,A);
subplot(6,1,6);
plot(t,s,'k');

