function [s] = func_aprox_legendre(t)
	for i = 1:length(t)
		s(i) = (45/16)*t(i) - (35/16)*t(i)^3;
	endfor
endfunction
