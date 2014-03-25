function [SNR,Ps,Pr] = snr(s,r,t)
	%Variables iniciales
	n = length(t); 
	%Calculo de potencia (PS)
	Ps = 0; %Inicializo la variable en 0
	for i=1:n
		Ps = s(i) ^ 2 + Ps;	
	endfor
	Ps = Ps/n;
	
	%Calculo de potencia (Pr)
	Pr = 0; %Inicializo la variable en 0
	for i=1:n
		Pr = r(i) ^ 2 + Pr;
	endfor
	Pr = Pr/n; 
	
	%Calculo SNR
	SNR = 10 * log10 (Ps / Pr);
endfunction
