%Diseño de un filtro Butter
Fm = 2000;
T = 1/Fm;
fc = 500;
fn = fc*2/Fm;%Normalizo la frecuencia de corte para que este entre 0 y 1 --> fc / (Fm/2)
wc = 2*pi*fc;% Expreso 500hz en radianes -- frecuencia de corte del filtro
n=2;%orden del filtro

%Realizo el diseño del analogico H(s)
function [Hs] = mybutter(wc,n,s,tipo)
	
	%Elijo el a segun el tipo
	if (tipo == "pasa bajos")
		s = s./wc; %Pasa bajos
	else
		s = wc./s; %Pasa altos
	endif
	
	% http://en.wikipedia.org/wiki/Butterworth_filter
	A=1;
	if(mod(n,2) == 0)
		%Para los ordenes pares
		for i = 1:n/2
			A .*= s.^2 - 2*s*cos( ((2*i+n-1)/(2*n))*pi ) + 1;
		endfor
	else
		%Para los ordenes impares
		for i = 1:(n-1)/2
			A .*= s.^2 - 2*s*cos( ((2*i+n-1)/(2*n))*pi ) + 1;
		endfor
		A*= s + 1; 
	endif
	
	Hs = 1./A;
	
endfunction

%Uso Bzt para hacer H(z)
w = 0:T:2*pi-T;
z = exp(j*w);
s = (2/T) * (1 - z.^-1)./(z.^-1 + 1); %BZT

%Creo el filtro
Hz = mybutter(wc,n,s,"pasa altos");

%grafico su respuesta en frecuencia
figure(1,"name","Implementacion propia de Butterworth sin prewarping");
plot(w*Fm/(2*pi),abs(Hz));

%Version con prewarping
wc = (2/T) * tan(wc*T/2); %BZT con prewarpig

%Creo el filtro
Hz2 = mybutter(wc,n,s,"pasa altos");

figure(2,"name","Implementacion propia de Butterworth con prewarping");
plot(w*Fm/(2*pi),abs(Hz2));


%Grafico el resultado correcto
figure(3,"name","Implementacion de matlab");
[B,A] = butter(n,fn,"high");
[h,w] = freqz(B,A,Fm,"whole",Fm);
plot(w,abs(h));
