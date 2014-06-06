function [A,E,g] = levinsondurbin(R,p)
	%R es la autocorrelacion (que puede acomodarse como una matriz de Toeplitz)
	%p es el orden que equivale a la cantidad de coeficientes que se necesitan para el filtro
	
	%Implementacion segun "A tutorial on linear prediction and Levinson-Durbin"
	%Primero hago los calculos previos o primera iteracion
	
	a1 = -R(2)/R(1); %-R(1)/R(0)
	A = [1 a1]; %A(1) = 1 y el resto son ceros para inicializar --> en realidad A(0) = 1
	E1 = R(1)+a1*R(2); % R(0) + a1*R(1)
	E = [E1 zeros(1,p-1)]; %pongo la primer fila de la matriz como vector error
	for i = 1:p
		%Primera parte
		aux = 0;
		for j = 1:i+1 
			aux += A(j) * R(i-j+1);
		endfor
		lambda = -1/E(i) * aux;
		%Segunda parte
		U = [A 0];
		V = [0 A(end:-1:1)]; %Es U invertido el orden
		Ak1 = U + lambda*V;
		A = [A Ak1]; 
		%Tercera parte
		Ek1 = E * (1- lambda^2);
		E = [E Ek1];
	endfor
	%Calculo la ganancia necesaria
	g = sqrt(E(1));
endfunction
