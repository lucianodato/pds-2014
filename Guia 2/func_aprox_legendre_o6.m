function [s] = func_aprox_legendre_o6(t)
	a1= sqrt(3/2);
	a3= -1*sqrt(7/32);
	a5= sqrt(11/2)*1/8;
	for i = 1:length(t)
		s(i) = a1*sqrt(3/2)*t(i) + a3*sqrt(7/2)*((5/2)*t(i)^3 - (3/2)*t(i)) + a5*sqrt(11/2) * (( (63*480*t(i)^5) - (480*70*t(i)^3) + (480*15*t(i))) / 3840) ;
	endfor
endfunction
