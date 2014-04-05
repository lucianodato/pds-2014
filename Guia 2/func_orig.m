function [s] = func_orig(t)
	for i = 1:length(t)
		if (t(i) < 0)
			s(i) = -1;
		else
			s(i) = 1;
		endif
	endfor
endfunction
