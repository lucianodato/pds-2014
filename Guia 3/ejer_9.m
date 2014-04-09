%Ejercicio 9

%Si se toma la muestra cada fin de mes Fm = 12?
%hay 15 valores t_fin=15?

Fm=1;%Porque sino no avanzaria de mes a mes
T=1/Fm;
t_ini= 0;
t_fin=15;
t=t_ini:t_fin-1;

m1 = load("merval1.txt");

N1= length(m1);
df=Fm/N1;
freq=-Fm/2:df:Fm/2-df;

fm1=fftp(m1);

subplot(2,2,1);
plot(m1);

subplot(2,2,2);
plot(freq,fm1);

%Agregando ceros en frecuencia interpolo en tiempo

fm1i=fft(m1);
N = length(fm1i);
nyquist=floor(N/2);

cant_ceros = 15;%Cantidad de ceros que agregaria agregar 15 equivale a doblar las muestras en tiempo

%Tengo que tener cuidado porque los 0 se agregan entre medio de lo que saca la fft de manera que extiendo las frecuencias
xaux=[fm1i(1:nyquist);zeros(N,1);fm1i(nyquist+1:N);];%Arme un vector auxiliar con los ceros entre medio de lo que saco fft
m1i=ifft(xaux).*2;%La multiplicacion es para conservar la amplitud original
N2=length(m1i);

subplot(2,2,3);
plot(real(m1i));%Real tengo que poner para que me pase a real los imaginarios sino dibuja cualquier cosa

%Comparo con lo calculado en merval2
m2 = load("merval2.txt");

subplot(2,2,4);
plot(m2);



