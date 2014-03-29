%Inicializacion de parametros

%Nuestro espacio es el compuesto por señales senoidales de:
%Amplitud 1
%Frecuencias Fs de 1 hz a 50 hz. FM = 101
%Fase = 0

t_ini = 0;
t_fin = 1;
Fm = 110;
fs_1 = 20;
fs_2 = 40;
fase1 = 0;
fase2 = 0;
A1 = 1;
A2 = 1;
Tm = 1 / Fm;
t = t_ini : Tm : (t_fin - Tm);

% ------- Señal compleja (Expresado por Sen y Cos) -------

s1r = cos(2*pi*fs_1*t + fase1);
s1i = sin(2*pi*fs_1*t + fase1);
s1c = s1r + j*s1i;

s2r = cos(2*pi*fs_2*t + fase2);
s2i = sin(2*pi*fs_2*t + fase2);
s2c = s2r + j*s2i;

%Señal Compleja 1
%[t,s1] = senoidal(Fm,fs_1,fase1,t_ini,t_fin,A1);
subplot(1,2,1);
plot(t,s1c,'k');

%Señal Compleja 2
%[t,s2] = senoidal(Fm,fs_2,fase2,t_ini,t_fin,A2);
subplot(1,2,2);
plot(t,s2c,'k');

s2c_conj = s2r - j*s2i;
disp('Norma s2c');
norm(s2c,2)
s3c = dot(s1c,s2c_conj)

