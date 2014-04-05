%Calculo del error cuadratico 
t_ini = -1;
t_fin = 1;
Fm = 10;
T = 1/Fm;
t=t_ini:T:t_fin -T;

% A - Calculo las funciones y luego el error cuadratico con una aproximacion
%con el polinomio de legendre de orden 4

s1 = func_orig(t);
s2 = func_aprox_legendre(t);

error1 = power(abs(s1.-s2),2);
merror1 = mean(error1)
subplot(3,1,1);
plot(t,s1);
subplot(3,1,2);
plot(t,s2);

% B - Tendria que generar una matriz con los valores de la funcion aproximada en donde varian los coeficientes

[s3,a1,a3] = func_aprox_legendre_var(t);

%calculo el error cuadratico con respecto a la funcion original
error2 = zeros(length(a1),length(a3));

for i = 1:length(a1)
	for j = 1:length(a3)
		for w = 1:length(t)
			error2(i,j) = error2(i,j) + power(abs(s1(i)-s3(i)),2);
		endfor
	endfor
endfor

subplot(3,1,3)
mesh(a1,a3,error2);
merror2 = mean(error2);

% C - Calculo el error cuadratico que resultaria con mas coeficientes
s4 = func_aprox_legendre_o6(t);
error3 = power(abs(s1-s4),2);
merror2 = mean(error3)

