%Ejercicio 7

%Condiciones iniciales nulas

Fm = 100;
T = 1/Fm;
t_ini = 0;
t_fin = 1;
t = t_ini:T:t_fin-T; 
N = length(t);
df=Fm/N;
freq=-Fm/2:df:Fm/2-df;

x=escalon_unitario(t);

%Hay que tener cuidado con el tamaño de los vectores
%El vector x lo tengo que recorrer entero 

%Inicializo en 0 todos los y

y1=zeros(1,length(t));
y2=zeros(1,length(t));
y3=zeros(1,length(t));
y4=zeros(1,length(t));
y5=zeros(1,length(t));

% 1 - AR
y1(1)=0;
y1(2)=0;
%Estas condiciones me agrandan el vector 2 muestras mas.
x1 = x;
for i = 3:N+2
	y1(i) = x1(i-2) + y1(i-2);
endfor

% 2 - MA
x2(1)=0;
x2(2:N+1) = x;
y2(1)=0;%Pongo afuera los valores para no hacer quilombo abajo con los indices
for i = 2:N+1
	y2(i) = x2(i) + 0.5*x2(i-1);
endfor

% 3 ARMA
y3(1)=0;
x3(1)=0;
x3(2:N+1) = x;

for i = 2:N+1
	y3(i) = x3(i) + 2*x3(i-1) - y3(i-1);
endfor

% 4 AR
y4(1)=0;
y4(2)=0;
x4= x;
for i = 3:N+2
	y4(i) = x4(i-2) + 0.5*y4(i-1) - 0.25*y4(i-2);
endfor

% 5 ARMA
y5(1)=0;
y5(2)=0;
x5(1)=0;
x5(2:N+1) = x;
for i = 3:N+2
	y5(i) =x5(i-1) + x5(i-2) + y5(i-2);
endfor
