%Transformada de Laplace
Fm2 = 50;
Ts = 1/Fm2;
w2= 0:Ts:2*pi-Ts;%Podria ser freq = 0:Fm2 --> w = 2*pi*freq*Ts
z2 = exp(j*w2);%Aproximo la s con la transformada de furier o la s "ideal"
s = log(z2)/Ts;
f2=-pi:Ts:pi-Ts;

h = (12500*s) ./ (44*s.^2 + 60225*s + 625*10^4);
h_f = [h(floor(length(h)/2)+1:length(h)) h(1:floor(length(h)/2))];

figure(1);
subplot(2,1,1);
plot(f2*(Fm2/(2*pi)),abs(h_f));%Expresamos los graficos de magnitud en dB
subplot(2,1,2);
plot(f2*(Fm2/(2*pi)),angle(h_f));

%Sacamos el valor de la frecuencia de corte a partir de buscar en el vector h
%Transformo las magnitudes a decibeles para poder hacer una comparacion correcta
val_max = 20*log10(max(abs(h)));
freq_corte = 0;
for i = 1:floor(length(h)/2) %Debo recorrer hasta nyquist para hallar la frecuencia de corte mayor
	if(20*log10(abs(h(i))) >= (val_max - 3) )
		freq_corte = i;
		break;
	endif
endfor
disp("Frecuencia de corte");
disp( w2(freq_corte)*(Fm2/(2*pi)) );

%Inicializamos
Fm=4*(w2(freq_corte)*(Fm2/(2*pi)));%Uso 4 veces la frecuencia de muestreo segun la frecuencia de corte hallada
%Pudimos notar que el H(s) se basa en un sistema de ecuaciones definidas para un tipo de filtro con una frecuencia de corte especifica para un espectro de determinada definicion frecuencial. Por lo tanto usar una frecuencia de muestreo que crea un espectro con mucho mayor resolucion frecuencial que la que tenia el filtro original, se observan deformaciones en la respuesta frecuencial. (Constatar en el coloquio!!!)
T=1/Fm;
w = 0:T:2*pi-T;
r = 1;
z = r*exp(j*w);
f=-pi:T:pi-T;


%Transformada de Euler

s1 = (1-z)./T;
h1 = (12500*s1) ./ (44*s1.^2 + 60225*s1 + 625*10^4);
h1_f = [h1(floor(length(h1)/2)+1:length(h1)) h1(1:floor(length(h1)/2))];

figure(2);
subplot(2,1,1);
plot(f*(Fm/(2*pi)),abs(h1_f));
subplot(2,1,2);
plot(f*(Fm/(2*pi)),angle(h1_f));
%freqz_plot(w,h1);

%Transformada Bilineal

s2 = (2/T) * (1-z)./(z+1);
h2 = (12500*s2) ./ (44*s2.^2 + 60225*s2 + 625*10^4);  

h2_f = [h2(floor(length(h2)/2)+1:length(h2)) h2(1:floor(length(h2)/2))];

figure(3);
subplot(2,1,1);
plot(f*(Fm/(2*pi)),abs(h2_f));
subplot(2,1,2);
plot(f,angle(h2_f));
%freqz_plot(w,h2);
