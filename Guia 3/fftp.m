function [fsp] = fftp(s)
	%Calcula la transformada y la postprocesa para mostrarla correctamente
	fs = abs(fft(s));%Fundamental el valor absoluto aca!
	N = length(fs);
	nyquist = floor(N/2);%En el caso que la longitud sea impar???
	
	fsp = zeros(1,N);%Vector de valores acomodados inicializado
	
	%Valores negativos
	for i = 1:nyquist
		fsp(i) = fs(nyquist + i);%desde nyquist +1 hasta N 
	endfor
	%Valores positivos
	for i = nyquist+1:N 
		fsp(i) = fs(i - nyquist);%desde 1 hasta nyquist +1 
	endfor
endfunction
