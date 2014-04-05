function [s] = func_aprox_legendre(t,o)
	%Calculo los coeficientes para el orden establecido
	for i = 1:o
		c = [1,0,-1];%Esto describe el polinomio (t^2 - 1)^i
		der = polyder(c);
		pol = sqrt((2*i + 1)/2) * 1/( (2^i)*i! ) * der;
		int = polyint(pol);
		a(i) = polyval(pol,i);
	endfor
	
	
	for i = 1:length(t)
		s(i) = a(i) * sqrt((2*i + 1)/2) * 1/( (2^i)*i! ) * deriv(power(t(i)^2 -1),t,i);
	endfor
endfunction
