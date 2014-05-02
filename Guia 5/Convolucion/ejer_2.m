% Elegimos de señal periodica un seno

Fm = 100;
N=1/Fm;
t_ini=0;
t_fin=1;
t=t_ini:N:t_fin-N;
fs_1=10;
fs_2=5;

s1 = sin(2*pi*t*fs_1);
s2 = sin(2*pi*t*fs_2);

%Faltaria para cada inciso hacer una grafica que complete el lado de la igualdad faltante para poder compararlos

%Inciso 1
c1 = convolucion(s1,s2);

figure(1);
plot(c1); 

%Inciso 2
c2 = conv(s1,s2);
plot(c2);

%Inciso 3 
#%h es el impulso que hace que s1 se haga s2
#h = deconv(s1,s2);
#%h contiene a a y b tengo que desarmarlo en dos vectores numerador y denominador
#%la cantidad de elementos de a y de b me dictaminaria la precision con la que el filtro aproxima y(n)? Cuantos?


%Inciso 4

f1 = fft(s1);
f2 = fft(s2);
c3= real(ifft(f1.*f2));

figure(3);
plot(c3);

%Inciso 5 

N=length(s1);
x = s1;
y = s2;
x(N+1:2*N) =  0;
y(N+1:2*N) =  0;

x1 = fft(x);
y1 = fft(y);
c4= real(ifft(x1.*y1));

figure(4);
plot(c4);

