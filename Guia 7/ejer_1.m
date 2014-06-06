%ejercicio 1

%generamos la señal de entrada para el sistema
Fm = 100;
T = 1/Fm;
t = 0:T:1-T;
n=length(t);

%entrada
x = randn(1,n);%media 0 varianza 1 por defecto

%H(z)
% H(z) = 1/(1- 0.3z^-1 + 0.4z^-2 - 0.2z^-3 ) Los a son 1 ; -0.3 ; 0.4 ; 0.2
% a = [1 -0.3 0.4 0.2]
y(-3) = 0;
y(-2) = 0;
y(-1) = 0;
for i = 1:n
	y(i) = 0.3*y(i-1) - 0.4*y(i-2) + 0.2*y(i-3) + x(i);
endfor 


