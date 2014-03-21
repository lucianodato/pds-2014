function [tn] = lineal_i(t)

if(abs(t) < 1) 
	tn = 1 - abs(t);
else
	tn = 0;
endif

endfunction
