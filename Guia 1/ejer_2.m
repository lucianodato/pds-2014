%Inicializacion de parametros

t_ini = 0;
t_fin = 1;
Fm = 100;
fs_1 = 2;
fase = 0;
A = 1;

% ------- Original -------

%Senoidal 1
[t,s] = senoidal(Fm,fs_1,fase,t_ini,t_fin,A);
subplot(4,1,1);
plot(t,s,'k');

% ------- Inversion -------

%Senoidal Invertida
[d] = inversion(s);
subplot(4,1,2);
plot(t,d,'k');

% ------- Rectificacion -------

%Senoidal Rectificada
[d] = rectificacion(s);
subplot(4,1,3);
plot(t,d,'k');

% ------- Cuantificacion -------

%Senoidal Cuantificada
[d] = cuantificacion(s,8);
subplot(4,1,4);
stem(t,d,'k');
