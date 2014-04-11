%Ejercicio 1

%Sistema Causal: En la practica significa que la ecuacion depende de los valores en tiempo actual o anteriores

%Sistema Lineal: Cumple con el principio de superposicion ax1 + ax2 = ay1 + ay2

%Sistema Invariante: Da una salida desplazada si la entrada esta desplazada. Pero el resultado no es afectado por el desplazamiento.

%Inicializacion de Vectores

Fm = 100;
T=1/Fm;
t=0:T:99; %-->Es el vector x[n]

%1
A=1;
w=2*pi*10;
n=length(t);
y1 =A*sin(w*T*n)*t;
subplot(4,2,1);
plot(y1);  

%Es causal lineal y variante en el tiempo (porque lo corro y tengo distinta fase para la senoidal)

%2
n0=1;
for i = n0:n
	y2(i) = sum(t(n0:i));
endfor

subplot(4,2,2);
plot(y2);

%Es causal, no lineal e invariante tiempo

%3
n1=n/2;
for i = 2:n1
	y3(i)=sum(t(i-n0:i+n0));
endfor

subplot(4,2,3);
plot(y3);  

%No es causal, es lineal e invariante tiempo

%4

for i = 2:n
	y4(i) = t(i - n0);
endfor

subplot(4,2,4);
plot(y4); 

%Es causal lineal e invariante tiempo


%5

y5 = exp(t);

subplot(4,2,5);
plot(y5);  

%Es causal,no lineal e invariante tiempo

%6

y6 = t+2;

subplot(4,2,6);
plot(y6);

%Es causal, no lineal (el 2 es un termino independiente) e invariante tiempo

%7

for i = n0:n
	y7(i) = i.*t(i);
endfor

subplot(4,2,7);
plot(y7);

%Es causal, no lineal e invariante en el tiempo


