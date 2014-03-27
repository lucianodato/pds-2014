function [me,va] = calculos_med_var_est(mat,c,f)

%Inicializo v
va = zeros(1,c);
me = zeros(1,c);
medias = zeros(1,f);
varianzas = zeros(1,f);

%Primero calculo y almaceno las medias y las varianzas
for i = 1:c %Avanza sobre t
	tg = zeros(1,f);

	
	for j = 1:f %avanza sobre las diferentes señales
		tg(j) = mat(j,i);%devuelve la señal de la matriz mats fila j
	endfor
	
	%Calculo la media
	medias(i) = mean(tg); 
	
	%Calculo la varianza
	varianzas(i) = var(tg);
	
endfor

me = mean(medias);
va = mean(varianzas);

endfunction
