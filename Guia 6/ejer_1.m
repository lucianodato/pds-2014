%Los polos y los ceros son las raices de los polinomios A y B los cuales forman la fraccion que define al filtro

%Polos - A
%paso de cordenadas polares (los grados los paso a radianes) a cartesianas y armo cada una de las raices
r1= 0.95;
r2= 0.80;

x=r1*cos(45*pi/180);
y=r1*sin(45*pi/180);
ra1 = x + i*y;

x=r1*cos(45*pi/180);
y=r1*sin(45*pi/180);
ra2 = x + i*y;

x=r1*cos(-45*pi/180);
y=r1*sin(-45*pi/180);
ra3 = x + i*y;

x=r1*cos(-45*pi/180);
y=r1*sin(-45*pi/180);
ra4 = x + i*y;

polos= [ra4 ra3 ra2 ra1];

%Ceros - B
x=r2*cos(30*pi/180);
y=r2*sin(30*pi/180);
rb1 = x + i*y;

x=r2*cos(-30*pi/180);
y=r2*sin(-30*pi/180);
rb2 = x + i*y;

x=r2*cos(60*pi/180);
y=r2*sin(60*pi/180);
rb3 = x + i*y;

x=r2*cos(-60*pi/180);
y=r2*sin(-60*pi/180);
rb4 = x + i*y;

ceros= [rb4 rb3 rb2 rb1];

%Armo los polinomios A y B a partir de las raices
A = real(poly(polos));
B = real(poly(ceros));

% a) Grafico el Diagrama de polos y ceros
figure(1,"name","Polos y Ceros");
zplane(B,A);


%Armo H(z)
%Hz = B(4)*z^3 + B(3)*z^2 + B(2)*z + B(1) / A(4)*z^3 + A(3)*z^2 + A(2)*z + A(1) 
% O armado con multiplicacion de monomios formados con las raices
%Hz = (z-rb1)*(z-rb2)*(z-rb3)*(z-rb4) / (z-ra1)*(z-ra2)*(z-ra3)*(z-ra4)

Fm = 200;
T = 1/Fm;
w = 0:T:pi-T;
z = exp(j*w);

Hz = B(4)*z.^-3 + B(3)*z.^-2 + B(2)*-z + B(1) / A(4)*z.^-3 + A(3)*z.^-2 + A(2)*-z + A(1); 

% b) Grafico la respuesta en frecuencia H(z)
figure(2,"name","Respuesta en frecuencia de 0 a PI sin normalizar");
plot(w*Fm/pi,abs(Hz));

% c) Normalizo la Amplitud aplicando la ganancia necesesaria calculada

g = max(abs(Hz));
%disp("Maxima amplitud de Hz"), disp(max(abs(Hz)));
%Si la amplitud del filtro es superior reduciria de lo contrario aumenta
%Multiplico H(z) por 1/g para normalizar

w = 0:T:2*pi-T;
z = exp(j*w);
Hzn = 1/g * (B(4)*z.^-3 + B(3)*z.^-2 + B(2)*-z + B(1) / A(4)*z.^-3 + A(3)*z.^-2 + A(2)*-z + A(1));
figure(3,"name","Respuesta de 0 a 2*PI Normalizada");
plot(w*Fm/pi,abs(Hzn));%--> w a hz -->divido por 2*pi y para desnormalizar multiplico por Fm/2 o sea multiplico por Fm/pi

% d) Cambiar los radios arriba y ver

% e) Genero las dos senoidales y las filtro
t = 0:T:1-T;
s1 = sin(2*pi*15*t);
s2 = sin(2*pi*25*t);

s = s1+s2;

figure(4,"name","Filtrado de una señal con el filtro normalizado - Fm = 200");
subplot(2,2,1);
plot(s);
subplot(2,2,2);
plot(abs(fft(s)));

%Filtro s con el filtro normalizado en el dominio frecuencial
%Para esto podria usar la funcion de convolucion que usa el dominio frecuencial (Es lo mismo que multiplicar en frecuencia) Con esto zafamos de los problemas de la convolucion discreta
sf = convolucion_f(s,real(ifft(Hzn)));
subplot(2,2,3);
plot(real(sf(1:Fm)));
subplot(2,2,4);
plot(abs(fft(sf)));

% f) Lo mismo pero con Fm = 125
Fm2 = 125;
T2 = 1/Fm2;
w2 = 0:T2:2*pi-T2;
z2 = exp(j*w2);
Hzn2 = 1/g * (B(4)*z2.^-3 + B(3)*z2.^-2 + B(2)*-z2 + B(1) / A(4)*z2.^-3 + A(3)*z2.^-2 + A(2)*-z2 + A(1));

t2 = 0:T2:1-T2;
s3 = sin(2*pi*15*t2);
s4 = sin(2*pi*25*t2);

s_2 = s3+s4;

figure(5,"name","Filtrado de una señal con el filtro normalizado - Fm = 125");
subplot(2,2,1);
plot(s_2);
subplot(2,2,2);
plot(abs(fft(s_2)));

%Filtro s con el filtro normalizado en el dominio frecuencial
sf_2 = convolucion_f(s_2,real(ifft(Hzn2)));
subplot(2,2,3);
plot(real(sf_2(1:Fm2)));
subplot(2,2,4);
plot(abs(fft(sf_2)));


