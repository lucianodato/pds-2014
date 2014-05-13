%Metodo en el dominio frecuencial

function [c] = convolucion_f(f,h)
	lf = length(f);%saco la longitud de la funcion
	lh = length(h);%saco la longitud del impulso
	N = lf+lh-1;% N es la longitud mayor
	
	f = [f zeros(1,N-lf)];%Completo con zero padding para que f y h me queden de longitud LT
	h = [h zeros(1,N-lh)];
	c = ifft(fft(f).*fft(h));%Por propiedad de la fft la convolucion en el tiempo es multiplicacion en frecuencia
	%disp(length(c));
	%El tema es el siguiente, esto retorna la convolucion circular, pero el hecho de hacer padding para que tengan longitud LT ambas hace que el resultado de la convolucion circular sea igual que el de la convolucion lineal. Por lo tanto lo que devolvemos es la convolucion lineal
endfunction
