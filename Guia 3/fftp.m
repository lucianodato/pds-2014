function [fsp] = fftp(s)
	%Calcula la transformada y la postprocesa para mostrarla correctamente
	fs = abs(fft(s));%Fundamental el valor absoluto aca!
	N = length(fs);
	nyquist = N/2;
	
	fsp = zeros(1,N);%Vector de valores acomodados inicializado
	
	%Valores negativos
	for i = 1:nyquist
		fsp(i) = fs(nyquist + i );%desde nyquist +1 hasta N 
	endfor
	%Valores positivos
	for i = nyquist+1:N+1 %Voy hasta N+1 porque empece desde 1 y sino perderia un valor y estaria desplazado
		fsp(i) = fs(i - nyquist);%desde 1 hasta nyquist +1 
	endfor
endfunction
