function [s,a1,a3] = func_aprox_legendre_var(t,T,vari)
	
	%Genero los vectores de coeficientes variados
	alpha1 = sqrt(3/2);
	a1 = alpha1-vari:T:alpha1+vari;

	alpha3 = -1*sqrt(7/32);
	a3 = alpha3-vari:T:alpha3+vari;
	
	for i = 1:length(a1)
		for j = 1:length(a3)
			for w = 1:length(t)
				s(i,j,w) =a1(i)*sqrt(3/2)*t(w) + a3(j)*(sqrt(7/2))*( (5/2)*t(w)^3 - (3/2)*t(w) );
			endfor
		endfor
	endfor
	
	
endfunction
