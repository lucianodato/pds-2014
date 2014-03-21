function [tn] = escalon_i(t)

if(t >= 0 && t < 1) 
	tn = 1;
else
	tn = 0;
endif

endfunction
