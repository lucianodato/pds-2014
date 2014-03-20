function [tn,sn] = interpolador(Fm,t,s,func,tasa)
	%cantidad de muestras originales
	n = lenght(t);
	%cantidad de nuevas muestras
	m = n * tasa;
	%Periodo Original
	T= 1/Fm;
	%Nuevo periodo
	Ti = 1/(Fm*tasa);
	
	%func es la funcion I de interpolacion
	switch (func)
	case 1:
		
