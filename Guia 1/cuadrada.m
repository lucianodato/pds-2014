function [t,c]=cuadrada(Fm,f,fase,t_ini,t_fin)
	% Fm frecuencia de muestreo
	% f frecuencia de la senoidal
	% fase inicial de la senoidal
	% t_ini tiempo de inicio
	% t_fin tiempo de finalizacion
	
	Tm = 1/Fm;
	t = t_ini : Tm : t_fin - Tm;
	c = zeros(1,length(t));
	m = mod(2*pi*f*t + fase,2*pi);
	for i = 1:length(m)
		if (m(i) >= pi)
			c(i) = -1;
		else
			c(i) = 1;
		endif
	endfor
endfunction 


