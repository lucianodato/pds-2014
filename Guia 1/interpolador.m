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
	tn = 1:Ti:1 - Ti
	sn = zeros(1,m);
	
	%func es la opcion de funcion I de interpolacion
	switch (func)
	case 1
		for i = 1:m % m es la totalidad de muestras totales despues de la interpolacion
			for j = 1:n % n es la totalidad de muestras anteriores a la interpolacion
				sn(i) = sn(i) + s(j)*escalon_i( (tn(i) - t(j) )/T);
			endfor 
		endfor
	case 2
		for i = 1:m % m es la totalidad de muestras totales despues de la interpolacion
			for j = 1:n % n es la totalidad de muestras anteriores a la interpolacion
				sn(i) = sn(i) + s(j)*lineal_i( (tn(i) - t(j) )/T);
			endfor 
		endfor
	case 3
		for i = 1:m % m es la totalidad de muestras totales despues de la interpolacion
			for j = 1:n % n es la totalidad de muestras anteriores a la interpolacion
				sn(i) = sn(i) + s(j)*sinc_i( (tn(i) - t(j) )/T);
			endfor 
		endfor
	endswitch
	
endfunction
