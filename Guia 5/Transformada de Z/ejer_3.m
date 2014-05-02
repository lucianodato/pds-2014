%Segun el h formamos el los coeficientes de a y b

#b = [0 -1 2 -2 1];
#a = [0 -0.1 0.9 1.7 1];
b = [1 -2 2 -1 0];
a = [1 1.7 0.8 -0.1 0];

%Polos son las raices del a
p = roots(a);
N= length(p);

%Ceros son las raices del b
c = roots(b);
M= length(c);

%Grafico los polos y los ceros
figure(1);
zplane(b,a);

%Grafico la respuesta en frecuencia del impulso dado por los polinomios a y b

figure(2);
[h,f]= freqz(b,a,1024,0,10000);
freqz_plot(f,h);

