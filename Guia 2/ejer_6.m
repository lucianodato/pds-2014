%Genero las señales
Fm = 100;
f1 = 1;
f2 = 2;
f3 = 3;
f4 = 4;
f5 = 5;
f6 = 6;
f7 = 7;
f8 = 8;
f9 = 9;
f10 = 10;
fase = 0;
t_ini=0;
t_fin=1;
A=1;

[t,s1] = senoidal(Fm,f1,fase,t_ini,t_fin,A);
[t,s2] = senoidal(Fm,f2,fase,t_ini,t_fin,A);
[t,s3] = senoidal(Fm,f3,fase,t_ini,t_fin,A);
[t,s4] = senoidal(Fm,f4,fase,t_ini,t_fin,A);
[t,s5] = senoidal(Fm,f5,fase,t_ini,t_fin,A);
[t,s6] = senoidal(Fm,f6,fase,t_ini,t_fin,A);
[t,s7] = senoidal(Fm,f7,fase,t_ini,t_fin,A);
[t,s8] = senoidal(Fm,f8,fase,t_ini,t_fin,A);
[t,s9] = senoidal(Fm,f9,fase,t_ini,t_fin,A);
[t,s10] = senoidal(Fm,f10,fase,t_ini,t_fin,A);

k1=1;
k2=4;
k3=2;
k4=6;
k5=9;
k6=0;
k7=8;
k8=3;
k9=5;
k10=7;

st = k1.*s1+k2.*s2+k3.*s3+k4.*s4+k5.*s5+k6.*s6+k7.*s7+k8.*s8+k9.*s9+k10.*s10;

%A Medir el grado de parecido de la resultante con cada onda
s1r=dot(s1,st);
s2r=dot(s2,st);
s3r=dot(s3,st);
s4r=dot(s4,st);
s5r=dot(s5,st);
s6r=dot(s6,st);
s7r=dot(s7,st);
s8r=dot(s8,st);
s9r=dot(s9,st);
s10r=dot(s10,st);

subplot(3,1,1);
bar([s1r,s2r,s3r,s4r,s5r,s6r,s7r,s8r,s9r,s10r]);

%B Lo mismo pero cambiando la fase de las senoidales

[t,s1f] = senoidal(Fm,f1,fase + 1*pi/8,t_ini,t_fin,A);
[t,s2f] = senoidal(Fm,f2,fase + 2*pi/8,t_ini,t_fin,A);
[t,s3f] = senoidal(Fm,f3,fase + 3*pi/8,t_ini,t_fin,A);
[t,s4f] = senoidal(Fm,f4,fase + 4*pi/8,t_ini,t_fin,A);
[t,s5f] = senoidal(Fm,f5,fase + 5*pi/8,t_ini,t_fin,A);
[t,s6f] = senoidal(Fm,f6,fase + 6*pi/8,t_ini,t_fin,A);
[t,s7f] = senoidal(Fm,f7,fase + 7*pi/8,t_ini,t_fin,A);
[t,s8f] = senoidal(Fm,f8,fase + 8*pi/8,t_ini,t_fin,A);
[t,s9f] = senoidal(Fm,f9,fase + 9*pi/8,t_ini,t_fin,A);
[t,s10f] = senoidal(Fm,f10,fase + 10*pi/8,t_ini,t_fin,A);

st2 = k1.*s1f+k2.*s2f+k3.*s3f+k4.*s4f+k5.*s5f+k6.*s6f+k7.*s7f+k8.*s8f+k9.*s9f+k10.*s10f;

s1r=dot(s1,st2);
s2r=dot(s2,st2);
s3r=dot(s3,st2);
s4r=dot(s4,st2);
s5r=dot(s5,st2);
s6r=dot(s6,st2);
s7r=dot(s7,st2);
s8r=dot(s8,st2);
s9r=dot(s9,st2);
s10r=dot(s10,st2);

subplot(3,1,2);
bar([s1r,s2r,s3r,s4r,s5r,s6r,s7r,s8r,s9r,s10r]);

%C Grafico para una onda cuadrada

[t,sc] = cuadrada(Fm,5.5,fase,t_ini,t_fin);

s1c=dot(s1,sc);
s2c=dot(s2,sc);
s3c=dot(s3,sc);
s4c=dot(s4,sc);
s5c=dot(s5,sc);
s6c=dot(s6,sc);
s7c=dot(s7,sc);
s8c=dot(s8,sc);
s9c=dot(s9,sc);
s10c=dot(s10,sc);

subplot(3,1,3);
bar([s1c,s2c,s3c,s4c,s5c,s6c,s7c,s8c,s9c,s10c]);

