%Segun el h formamos el los coeficientes de a y b
Fm = 100;
T=1/Fm;
w = 0:T:2*pi-T;
r = 1;
z = r*exp(j*w);
f=-pi:T:pi-T;

b = -1 + 2*z -2*z.^2 + z.^3;
a = -0.1 + 0.8*z + 1.7*z.^2 + z.^3; 
h = b./a; 
h_f = [h(floor(length(h)/2)+1:length(h)) h(1:floor(length(h)/2))];

#b = [0 -1 2 -2 1];
#a = [0 -0.1 0.8 1.7 1];
b1 = [1 -2 2 -1 0];
a1 = [1 1.7 0.8 -0.1 0];

%Polos son las raices del a
p = roots(a1);
N= length(p);

%Ceros son las raices del b
c = roots(b1);
M= length(c);

%Grafico los polos y los ceros
figure(1);
zplane(b1,a1);

%Grafico la respuesta en frecuencia del impulso dado por los polinomios a y b

figure(2);
#[h,f]= freqz(b,a,1024,0,10000);
#freqz_plot(f,h);
subplot(2,1,1);
plot(f,abs(h_f));
subplot(2,1,2);
plot(f,angle(h_f));
