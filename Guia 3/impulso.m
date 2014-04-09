function [s] = impulso(t);
	N=length(t);
	s(1)=1;
	s(2:N)=0;
endfunction
