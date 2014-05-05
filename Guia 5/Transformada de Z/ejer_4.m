%Inicializamos
Fm=1000;
T=1/Fm;
w = 0:T:2*pi-T;
r = 1;
z = r*exp(j*w);
f=-pi:T:pi-T;

#%---VER!!!
%Transformada de Laplace
Ts = 1/10000;%Esto es por la propiedad de que al disminuir la freq de muestreo en tiempo aumenta la definicion frecuencial
w2= 0:Ts:2*pi-Ts;
z2 = r*exp(j*w2);
s = log(z2)/Ts;
%s = [s zeros(1,10000)];
f2=-pi:Ts:pi-Ts;

h = (12500*s) ./ (44*s.^2 + 60225*s + 625*10^4);
h_f = [h(floor(length(h)/2)+1:length(h)) h(1:floor(length(h)/2))];
figure(1);
subplot(2,1,1);
plot(f2,abs(h_f));
subplot(2,1,2);
plot(f2,angle(h_f));

#%Sacamos el valor de la frecuencia de corte a partir de buscar en el vector h
#val_max = max(abs(h2));
#freq_corte = 0;
#for i = 1:length(h2)
#	if(h2(i) <= (val_max - 3))
#		freq_corte = i;
#	endif
#endfor
#disp("Frecuencia de corte");
#disp(freq_corte);



%Transformada de Euler

s1 = (1-z)./T;
h1 = (12500*s1) ./ (44*s1.^2 + 60225*s1 + 625*10^4);
h1_f = [h1(floor(length(h1)/2)+1:length(h1)) h1(1:floor(length(h1)/2))];

figure(2);
subplot(2,1,1);
plot(f,abs(h1_f));
subplot(2,1,2);
plot(f,angle(h1_f));
%freqz_plot(w,h1);

%Transformada Bilineal

s2 = (2/T) * (1-z)./(z+1);
h2 = (12500*s2) ./ (44*s2.^2 + 60225*s2 + 625*10^4);  

h2_f = [h2(floor(length(h2)/2)+1:length(h2)) h2(1:floor(length(h2)/2))];

figure(3);
subplot(2,1,1);
plot(f,abs(h2_f));
subplot(2,1,2);
plot(f,angle(h2_f));
%freqz_plot(w,h2);
