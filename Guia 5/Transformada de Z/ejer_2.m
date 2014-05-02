%Declaramos las funciones
Fm = 10000;
T=1/Fm;
w = 0:T:2*pi-T;
r = 1;
z = r*exp(j*w);
f=-pi:T:pi-T;


%Para el 1

#a = [0.25 -0.5 1];
a = z.^2 - 0.5*z - 1;
#b = [0 0 1];
b = z.^2;

h1 = b./a;
h1_f = [h1(floor(length(h1)/2)+1:length(h1)) h1(1:floor(length(h1)/2))];

figure(1);
#[h1,f1] = freqz(b,a,N,0,Fs);
#freqz_plot(f1,h1);

subplot(2,1,1);
plot(f,abs(h1_f));%Frecuencia
subplot(2,1,2);
plot(f,angle(h1_f));%Fase



%Para el 2

#a = [-1 -1 1];
a = z.^2 - 1*z - 1;
#b = [0 1];
b = z;
h2 = b./a;
h2_f = [h2(floor(length(h2)/2)+1:length(h2)) h2(1:floor(length(h2)/2))];

figure(2);
#[h2,f2] = freqz(b,a,N,0,Fs);
#freqz_plot(f2,h2);

subplot(2,1,1);
plot(f,abs(h2_f));%Frecuencia
subplot(2,1,2);
plot(f,angle(h2_f));%Fase

%Para el 3

#a = [6 -2 1];
#b = [0 0 7];
a = z.^2 - 2*z +6 ;
b = 7*z.^2;
h3 = b./a;
h3_f = [h3(floor(length(h3)/2)+1:length(h3)) h3(1:floor(length(h3)/2))];

figure(3);
#[h3,f3] = freqz(b,a,N,0,Fs);
#freqz_plot(f3,h3);

subplot(2,1,1);
plot(f,abs(h3_f));%Frecuencia
subplot(2,1,2);
plot(f,angle(h3_f));%Fase

%Para el 4

a = [0 0 0 0 0 0 0 0 1];
b = [1/128 1/64 1/32 1/16 1/8 1/4 1/2 1];

a = z.^7 ;
b = (1/128)*z.^7 + (1/64)*z.^6 + (1/32)*z.^5 + (1/16)*z.^4 + (1/8)*z.^3 + (1/4)*z.^2 + (1/2)*z + 1;
h4 = b./a;
h4_f = [h4(floor(length(h4)/2)+1:length(h4)) h4(1:floor(length(h4)/2))];

figure(4);
#[h4,f4] = freqz(b,a,N,0,Fs);
#freqz_plot(f4,h4);

subplot(2,1,1);
plot(f,abs(h4_f));%Frecuencia
subplot(2,1,2);
plot(f,angle(h4_f));%Fase


