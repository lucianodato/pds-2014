function [s,a1,a3] = func_aprox_legendre_var(t)
	s = zeros(length(t),1);
	a1 = zeros(length(t),1);
	a3 = zeros(length(t),1);
	
	T= 1/length(t);
	
	%Genero los vectores de coeficientes variados
	a1(1) = sqrt(3/2) - 0.5;
	for i = 1:length(t)-1
		a1(i+1) = a1(i) + T;
	endfor

	a3(1) = -1*sqrt(7/32) -0.5;
	for i = 1:length(t)-1
		a3(i+1) = a3(i) + T;
	endfor
	
	for i = 1:length(a1)
		for j = 1:length(a3)
			s =a1(i)*sqrt((3/2)*t) + a3(j)*(sqrt(7/2))*( (5/2)*t.^3 - (3/2)*t );
		endfor
	endfor
endfunction
