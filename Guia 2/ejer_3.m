%Inicializacion de parametros

%Nuestro espacio es el compuesto por señales senoidales de:
%Amplitud 1
%Frecuencias Fs de 1 hz a 50 hz. FM = 101
%Fase = 0

t_ini = 0;
t_fin = 1;
Fm = 1000;
fs_1 = 20;
fs_2 = 20;
fase1 = 0;
fase2 = 0;
A1 = 1;
A2 = 1;

% ------- Original -------

%Senoidal 1
[t,s1] = senoidal(Fm,fs_1,fase1,t_ini,t_fin,A1);
subplot(1,2,1);
plot(t,s1,'k');

%Senoidal 2
[t,s2] = senoidal(Fm,fs_2,fase2,t_ini,t_fin,A2);
subplot(1,2,2);
plot(t,s2,'k');

s3 = dot(s1,s2); %dot es el producto interno sin normalizar
%norma1 = norm(s1,2)

%Claramente cuando las frecuencias de las ondas son diferentes el producto interno es muy cercano a 0. 
%Cuando las ondas son iguales el producto interno da la mitad de la frecuencia de muestreo, con la misma fase 
%En el mismo caso pero desfazadas por pi el resultado es lo mismo pero negativo
%En el mismo caso pero desfazados por pi/2 da cercano a cero
%En el mismo caso pero desfazados por pi/4 da un numero entre 0 y la mitad de la frecuencia de muestreo
%Pregunta= Porque cuando las ondas son iguales el producto interno es igual al cuadrado de la norma??? (Ver formulas)

