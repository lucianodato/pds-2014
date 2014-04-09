function [] = verif_ortogonalidad(a,b)
	%Tengo que hacer el producto interno y me tiene que dar 0
	p_int=dot(a,b);
	if (p_int == 0)
		disp("    Son ortogonales"),disp(p_int);
	else
		disp("    No son ortogonales"),disp(p_int);
	endif
endfunction
