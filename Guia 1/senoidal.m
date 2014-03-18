[t,s] = senoidal (Fm,f,fase,t_ini,t_fin,amp)
	% Fm frecuencia de muestreo
	% f frecuencia de la senoidal
	% fase inicial de la senoidal
	% t_ini tiempo de inicio
	% t_fin tiempo de finalizacion
	% amp aplitud
	
	% Tm perido de tiempo segun el muestreo de frecuencia
	Tm = 1/Fm
	% t vector con los tiempos segun el periodo
	t = t_ini : Tm : t_fin - Tm
	% s funcion senoidal amplificada con valores en t segun la frecuencia y la fase indicada
	s = amp * sin(2*pi*f*t+fase)
	
	
