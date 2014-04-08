%Ejercicio 1

T=0.001;
Fm = 1/T;
t_ini = 0;
t_fin = 1;
t=t_ini:T:t_fin-T;


s = sin(2*pi*10*t) + 4*sin(2*pi*20*t);

subplot(3,2,1);
plot(s);

% 1 Calculo la transformada y grafico

%Armo el eje de frecuencias
df= Fm/length(t);%delta de f o resolucion de frecuencias
freq = -Fm/2:df:Fm/2;%1 es la frecuencia inicial (+-)Fm/2 es la frecuencia nyquist

fsp = fftp(s);
subplot(3,2,2);
plot(freq,fsp);

% 2 Verificacion del teorema de parseval

Es=ceil(sum(s.^2)); %me devuelve un numero con comas (todos ceros) por eso uso el ceil para truncarlo
Ef=(1/length(s))*sum(abs(fsp).^2);


if (Es == Ef)
	disp("Se cumple el teorema de parseval");
else
	disp("No se cumple el teorema de parseval");
endif

% 3 Con la señal +4

s1 = s+4;

fsp1 = fftp(s1);
subplot(3,2,3); 
plot(freq,fsp1);

%es como si hubiese sumado un delta de dirac (impulso en discreto) con un valor de amplitud 4*la amplitud del delta


% 4 Con f1=10 y f2=11

s2 = sin(2*pi*10*t) + 4*sin(2*pi*11*t);

fsp2 = fftp(s2);
subplot(3,2,4); 
plot(freq,fsp2);

%Se nota que la definicion en frecuencia no es lo suficientemente buena para representar frecuencias cercanas

% 5 Con f1=10 y f2=10.5

s3 = sin(2*pi*10*t) + 4*sin(2*pi*10.5*t);

fsp3 = fftp(s3);
subplot(3,2,5); 
plot(freq,fsp3);

%Se nota que la definicion en frecuencia no es lo suficientemente buena para representar frecuencias cercanas

% 6 Con t_fin = 0,72
t_ini = 0;
t_fin = 0.72;
t1=t_ini:T:t_fin-T;
df1= Fm/length(t1);
freq1 = -Fm/2:df1:Fm/2;

s4 = sin(2*pi*10*t1) + 4*sin(2*pi*11*t1);

fsp4 = fftp(s4);
subplot(3,2,6); 
plot(freq1,fsp4);

%al reducir el tiempo total aumenta la definicion en frecuencias
