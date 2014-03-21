%Inicializacion de parametros

t_ini = 0;
t_fin = 1;
Fm = 100;
fs_1 = 50;
fs_2 = 35;
fs_3 = 20;
fs_4 = 5;
fase = 0;
A = 1;

% ------- Funcion SENOIDAL -------

%Senoidal 1
[t,s] = senoidal(Fm,fs_1,fase,t_ini,t_fin,A);
subplot(3,4,1);
plot(t,s,'k');
%Senoidal 2
[t,s] = senoidal(Fm,fs_2,fase,t_ini,t_fin,A);
subplot(3,4,2);
plot(t,s,'k');
%Senoidal 3
[t,s] = senoidal(Fm,fs_3,fase,t_ini,t_fin,A);
subplot(3,4,3);
plot(t,s,'k');
%Senoidal 4
[t,s] = senoidal(Fm,fs_4,fase,t_ini,t_fin,A);
subplot(3,4,4);
plot(t,s,'k');

% ------- Funcion SINC -------

t_ini = -1;
t_fin = 1;
%Sinc 1
[t,x] = sinc(Fm,fs_1,t_ini,t_fin);
subplot(3,4,5);
plot(t,x,'k');
%Sinc 2
[t,x] = sinc(Fm,fs_2,t_ini,t_fin);
subplot(3,4,6);
plot(t,x,'k');
%Sinc 3
[t,x] = sinc(Fm,fs_3,t_ini,t_fin);
subplot(3,4,7);
plot(t,x,'k');
%Sinc 4
[t,x] = sinc(Fm,fs_4,t_ini,t_fin);
subplot(3,4,8);
plot(t,x,'k');

% ------- Funcion CUADRADA -------

t_ini = 0;
t_fin = 1;
fase = 1;
%Cuadrada 1
[t,c] = cuadrada(Fm,fs_1,fase,t_ini,t_fin);
subplot(3,4,9);
plot(t,c,'k');
%Cuadrada 2
[t,c] = cuadrada(Fm,fs_2,fase,t_ini,t_fin);
subplot(3,4,10);
plot(t,c,'k');
%Cuadrada 3
[t,c] = cuadrada(Fm,fs_3,fase,t_ini,t_fin);
subplot(3,4,11);
plot(t,c,'k');
%Cuadrada 4
[t,c] = cuadrada(Fm,fs_4,fase,t_ini,t_fin);
subplot(3,4,12);
plot(t,c,'k');

