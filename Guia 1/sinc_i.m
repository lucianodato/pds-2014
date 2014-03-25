function [tn] = sinc_i(t)

%Tenemos que llevarlo a radianes
t = pi*t;

if (t != 0)
	tn = (sin(t))/t;
else
	tn = 1;
endif

endfunction
