function [t,x]=sinc(Fm,f,t_ini,t_fin)
	% Fm frecuencia de muestreo
	% f frecuencia de la senoidal
	% t_ini tiempo de inicio
	% t_fin tiempo de finalizacion
	
	Tm = 1/Fm;
	t = t_ini : Tm : (t_fin - Tm) ;	
	if (t == 0) 
		x = 1;
	else
		x = sin(2*pi*f*t) ./ (2*pi*f*t);
	endif
endfunction
	

	
			 
