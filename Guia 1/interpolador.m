function [tn,sn] = interpolador(t,s,func,tasa)
	%En primera instancia tengo que tener los datos de la señal original
	
	%cantidad de muestras originales o Fm original
	n = length(t);
	%Periodo Original
	T= 1/n;
	
	%cantidad de nuevas muestras o Fmn (Frecuencia de muestreo nueva)
	m = n * tasa;
	%Nuevo periodo
	Ti = 1/m;
	% el nuevo t incluyendo las muestras nuevas
	tn = t(1):Ti:(t(n) + T) - Ti; 
	%como en t no incluyo la ultima muestra para sacar el t_fin original deberia sumarle a el valor de t(n) un paso T
	sn = zeros(1,m);
	
	%func es la opcion de funcion I de interpolacion
	switch (func)
	case 1
		for i = 1:m % contador de m
			for j = 1:n % contador de n
				sn(i) = sn(i) + s(j)*escalon_i( (tn(i) - t(j) )/T);
			endfor 
		endfor
	case 2
		for i = 1:m % contador de m
			for j = 1:n % contador de n
				sn(i) = sn(i) + s(j)*lineal_i( (tn(i) - t(j) )/T);
			endfor 
		endfor
	case 3
		for i = 1:m % contador de m
			for j = 1:n % contador de n
				sn(i) = sn(i)+ s(j)*sinc_i( (tn(i) - t(j) )/T);
			endfor 
		endfor
	endswitch
	
endfunction
