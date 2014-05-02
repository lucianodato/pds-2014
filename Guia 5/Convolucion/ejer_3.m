%Inicialización de parametros
Fm=100;
N=1/Fm;
t_ini=-1;
t_fin=1;
t=t_ini:N:t_fin-N;
a=0.5; % Constante a
%Impulsos de la serie
Ha=sin(8*t);
Hb=power(a,t);
%Señal de entrada X(n) ---> X[n] = Sum(x[k]*delta[n-k]) - a*Sum(x[k]*delta[n-k-1])
x=zeros(1,N);
x(1)=1;
for i=2:N
	x(i)= 1-a*1;
endfor
%Señal w(n) Convolución con Ha(n) --> w(n)=x(n).*Ha(n);
w1=convolucion(x,Ha);
%Señal y(n) Convolución Hb(n) --> y(n)=w(n).*Hb(n);
y1=convolucion(w1,Hb);
%Dibujo el resultado de la convolución en serie (1)
figure(1);
subplot(3,1,1);
plot(t,x);
subplot(3,1,2);
plot(t,w1);
subplot(3,1,3);
plot(t,y1);
%Señal w(n) Convolución con Ha(n) --> w(n)=x(n).*Hb(n);
w2=convolucion(x,Hb);
%Señal y(n) Convolución Hb(n) --> y(n)=w(n).*Ha(n);
y2=convolucion(w2,Ha);
%Dibujo el resultado de la convolución en serie (2)
figure(2);
subplot(3,1,1);
plot(t,x);
subplot(3,1,2);
plot(t,w2);
subplot(3,1,3);
plot(t,y2);

%comprobamos la propiedad asociativa
%Señal w(n) Convolución con de los impulsos --> w(n)=Ha(n).*Hb(n);
h=convolucion(Ha,Hb);
%Señal y(n) Convolución con la señal --> y(n)=x(n).*h(n);
y3=convolucion(x,h);
%Dibujo el resultado de la convolución en serie (3)
figure(3);
subplot(3,1,1);
plot(t,x);
subplot(3,1,2);
plot(t,h);
subplot(3,1,3);
plot(t,y3);
