function [d] = cuantificacion(sv,N)
	%N son los niveles de cuantificacion
	%q es lo analogo a t pero para cuantificacion
	
	H = 1/N;
	sv = sv .- min(sv);
	d = zeros(size(sv));
	for i = 1:size(sv)
		if (sv(i) < 0)
			d(i) = 0;
		else
			if ( (sv(i) >= 0) && (sv(i) < (N-1)*H) )
				d(i) = H*ceil(sv(i)/H);
			else
				d(i) = (N - 1)*H;
			endif
		endif
	endfor	
	d = d .+ min(sv);
endfunction
