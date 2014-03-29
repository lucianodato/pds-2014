%Inicializacion de parametros

%Nuestro espacio es el compuesto por señales senoidales de:
%Amplitud 1
%Frecuencias Fs de 1 hz a 50 hz. FM = 101
%Fase = 0

t_ini = 0;
t_fin = 1;
Fm = 1000;
fs_1 = 20;
fs_2 = 54;
fase1 = 0;
fase2 = 0;
A1 = 1;
A2 = 1;
alpha= -3;
% ------- Original -------

%Senoidal 1
[t,s1] = senoidal(Fm,fs_1,fase1,t_ini,t_fin,A1);
subplot(1,4,1);
plot(t,s1,'k');

%Senoidal 2
[t,s2] = senoidal(Fm,fs_2,fase2,t_ini,t_fin,A2);
subplot(1,4,2);
plot(t,s2,'k');

%Senoidal 3
subplot(1,4,3);
plot(t,(s1+s2),'k');

%Senoidal 4
subplot(1,4,4);
plot(t,(s1*alpha),'k');

%Misma frecuencia y misma fase se suma la amplitud

%Misma amplitud y misma frecuencia con 1/8 de diferencia en fase, la amplitud no es la suma (90% suma aprox) 
%Misma amplitud y misma frecuencia con 1/4 de diferencia en fase, la amplitud no es la suma (70% suma aprox) 
%Misma amplitud y misma frecuencia con pi de diferencia en fase (180º), la amplitud es casi cero.
% La fase afecta la suma de la amplitud. Cuando las fases de las ondas son las mismas la suma de la Amp. es max (A1 + A2). Cuando no estan sincronizadas la suma de la Amp < (A1 + A2) [Llega aprox cero cuando Phi = Pi]
%Si las frecuencias son armonicos ( f1 (frecuencia fundamental). f2 = Nf1; con n e Naturala ser es). La Amp. nunca llega a ser maxima. A < A1 + A2.
% Con dif. frecuencias (No armonicas) llega a ser max la amplitud en ciertas muestras pero nunca se pasa del maxima Amp. posible Amax = A1 + A2

%Ergo: Se verifica que la suma cerrada se cumple, cuando las señales del conjunto suman una Amp. (En la suma) 0 <= n(A1 + A2) <= A(definido por el conjunto)

%Con respecto al producto por un escalar es claro que solo se modifica la amplitud. De esto concluimos que la multiplicacion por un escalar deberia ser menor o igual a la amplitud definida por el conjunto.

%Sea S (conjunto)-> As (amp. max conjunto), La señal multiplicada por un escalar (alpha) debe tener una Ac <= As donde a*Ac <= As / a < As / Ac.  

