function [tn] = sinc_i(t)

if (t == 0)
	tn = 1;
else
	tn = sin(t)/t;
endif

endfunction
