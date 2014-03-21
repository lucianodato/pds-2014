function [tn] = sinc_i(t)

if (t != 0)
	tn = (sin(t))/t;
else
	tn = 1;
endif

endfunction
