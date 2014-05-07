% Elegimos de señal periodica un seno
Fm = 100;
N=1/Fm;
t_ini=0;
t_fin=1;
t=t_ini:N:t_fin-N;
fs_1=11;
fs_2=5;

s1 = sin(2*pi*t*fs_1);
s2 = square(2*pi*t*fs_2);

%Faltaria para cada inciso hacer una grafica que complete el lado de la igualdad faltante para poder compararlos

%Inciso 1
c1 = convolucion_f(s1,s2);

figure(1);
plot(real(c1)); 

%Inciso 2
figure(2);
c2 = conv(s1,s2);
plot(c2);

%Inciso 3 
%Esto se interpreta como la convolucion entre s1 con s2 siendo s2 el polinomio que define el filtro FIR es decir el polinomio b
%Hacemos zero padding para que la convolucion lineal se transforme en circular
c5 = filter([s2 zeros(1,length(s1)-1)],[1 zeros(1,2*length(s1)-2)],[s1 zeros(1,length(s1)-1)]);
figure(5);
plot(c5);


%Inciso 4
%Aca se ve bien como difieren la convolucion circular y la lineal tanto en valores como en cantidad de muestras

c3= ifft(fft(s1).*fft(s2));

figure(3);
plot(real(c3));

%Inciso 5 

N=length(s1);
x = s1;
y = s2;
x = [x zeros(1,N-1)];
y = [y zeros(1,N-1)];

c4= ifft(fft(x).*fft(y));

figure(4);
plot(real(c4));

