%Ejercicio 3

Fm=10;
T = 1/Fm;
t_ini = 0;
t_fin = 1;
t=t_ini:T:t_fin-T;
N=length(t);
%k=1:N;%0 a N-1
%omega_k=(2*pi*k)/N;

%una que cumple con omega_k y respete el teorema de nyquist
k1=3;
omega1=(2*pi*k1)/N;
s1= sin(omega1*t);

%una que no cumpla y respete el teorema de nyquist
k2=3.5;
omega2=(2*pi*k2)/N;
s2= sin(omega2*t);

subplot(2,2,1);
plot(t,s1,t,s2);

% doble de longitud

t_ini1 = 0;
t_fin1 = 2;
t1=t_ini1:T:t_fin1-T;
N1=length(t1);

%Concatenadas

s1c(1:N1/2)=s1;
s1c(N1/2 + 1 :N1)=s1;

s2c(1:N1/2)=s2;
s2c(N1/2 + 1 :N1)=s2;


subplot(2,2,2);
plot(t1,s1c,t1,s2c);

%dobladas

%una que cumple con omega_k y respete el teorema de nyquist
k1d=3;
omega1d=(2*pi*k1d)/N1;
s1d= sin(omega1d*t1);

%una que no cumpla y respete el teorema de nyquist
k2d=3.5;
omega2d=(2*pi*k2d)/N1;
s2d= sin(omega2d*t1);

subplot(2,2,3);
stem(t1,s1d);
subplot(2,2,4);
stem(t1,s2d);

