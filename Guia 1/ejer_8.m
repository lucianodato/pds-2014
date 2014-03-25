%Inicializacion de parametros
t_ini = 0;
t_fin = 1;
Fm = 50;
T = 1/Fm;
fase = 0;
amp = 1;
f = 5;
t1 = t_ini:T:t_fin - T;

%Señal de ruido aleatoria con length(t)
r = randn(1,length(t1));	%media 0 varianza 1 por defecto

%Señal Original
[t,s]=senoidal(Fm,f,fase,t_ini,t_fin,amp);
subplot(1,3,1);
% Primer Figura
figure (1);
plot(t,s);
title('Original (S)');

%Señal Aleatoria
subplot(1,3,2);
plot(t1,r);
title('Ruido (r)');

%Sumo las dos señales en una una g (Grafica)
g = s + r; 
subplot(1,3,3);
plot(t1,g);
title('Suma (S + r)');

%Calculo la Relación SNR ( SNR = 10.log (Ps/Pr))

[SNR,Ps,Pr] = snr(s,r,t);

%	Parte A (Muestros los datos originales).

display("______Datos (Parte A)_____")
display("Potencia señal Original (Ps)_")
Ps
display("Potencia de Ruido (Pr)_")
Pr
display("Relación Señal-Ruido (SRN)_")
SNR

%	Parte B (Multiplico la señal de ruido por una constante).
% Recordar: g = s + a.r, donde a (alpha) es una constante que mod. a la señal de ruido.

a = randn(1,1); % Es aleatoria
sb = s;
rb = a*r;
[SNR_b,Ps_b,Pr_b] = snr(sb,rb,t);

% Segunda Figura
figure (2);
plot(t,sb);
title('Original (S)');

%Señal Aleatoria
subplot(1,3,2);
plot(t,rb);
title('Ruido Mod. (r)');

%Sumo las dos señales en una una g (Grafica)
gb = sb + rb; 
subplot(1,3,3);
plot(t,gb);
title('Suma (g = s + a.r)');

display("______Datos (Parte B)_____")
display("Potencia señal Original (Ps)_")
Ps_b
display("Potencia de Ruido Mod. (Pr)_")
Pr_b
display("Relación Señal-Ruido (SRN)_")
SNR_b

%	Parte C (Hayar para una SNR  de 0db).

% Ya tengo los dos potencias y la relación entre las mismas. Calculo la parte (C) del ejercicio.
% Debo hayar una constante alpha (a) tal que la relación entre El Ps y el Pr (el SNR) sea 0 db.
% Existe una relación entre el Pr original  y el Pr_Cero - valor que se requiere para hayar un SNR de "zero" db).
% Encontrando este valor (Pr_Cero) podemos calcular despejando el valor de la constante alpha, constante que nos dice cuanta potencia
% deberia de tener la señal de ruido para generar una relación señal ruido de cero.

%FORMULAS PARA EL CALCULO.
%Calculo del Pr_cero.
%Pr_cero = Ps / (10 ^ (SNR / 10)); Donde SNR = 0 siempre y cuando quisieramos tener una SNR de 0db.
%Calculo de la constante alpha
%Pr_cero = (alpha ^ 2) * Pr --> alpha = sqrt(Pr_cero / Pr);

SNR_0 = 0; 
Pr_cero = Ps / (10 ^ (SNR_0 / 10));
a_cero = sqrt(Pr_cero / Pr);

%------------------------------------

sc = s;
rc = a_cero*r;
[SNR_c,Ps_c,Pr_c] = snr(sc,rc,t);

% Tercera Figura
figure (3);
plot(t,sc);
title('Original (S)');

%Señal Aleatoria
subplot(1,3,2);
plot(t,rc);
title('Ruido Mod. (r)');

%Sumo las dos señales en una una g (Grafica)
gc = sc + rc; 
subplot(1,3,3);
plot(t,gc);
title('Suma (g = s + a_cero.r)');

%------------------------------------

display("______Datos (Parte C)_____")
display("Potencia señal Original (Ps)_")
Ps_c
display("Potencia de Ruido (Pr)_")
Pr_c
display("Relación Señal-Ruido (SRN)_")
SNR_c

