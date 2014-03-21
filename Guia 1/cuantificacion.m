function [d] = cuantificacion(sv,N)
	%N son los niveles de cuantificacion
	%q es lo analogo a t pero para cuantificacion
	
	%Resto el minimo valor para positivizar la señal(el minimo valor es negativo)
	dv = sv - min(sv);
	%H paso de amplitud
	H = (max(sv) - min(sv))/N;
	%reservo el tamaño para los valores de los vectores de salidas
	d = zeros(1,length(sv));
	
	
	for i = 1:length(d)
		
		if (dv(i) < 0)
			%los valores negativos se hacen 0
			d(i) = 0;
		endif
		if (dv(i) >= 0 && dv(i) < (N-1)*H)
			%parte creciente del escalon
			%fix redondea hacia 0
			d(i) = H*floor(dv(i)/H);
		endif
		if(dv(i) >= (N-1)*H)
			%parte constante del escalon
			d(i) = (N - 1)*H;
		endif
		
	endfor
	
	%Sumo el minimo valor para restablecer la posicion deseada
	if (min(sv) < 0)
		d = d + min(sv);
	endif
endfunction
