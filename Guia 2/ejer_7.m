%En primera instancia leo el archivo y lo guardo en un vector
s = load("te.txt");

%Extraigo las caracteristicas posibles de la señal
N = length(s);
Fm = 8000; %dato del problema
T = 1/Fm;

%Guardo el archivo wav para procesarlo
%wavwrite(s,11025,32,"Señal.wav");

#%Grafico la señal entrante
#%plot(s);

%Importo los archivos editados
t1 = wavread("Tono1.wav");
t2 = wavread("Tono2.wav");
t3 = wavread("Tono3.wav");
t4 = wavread("Tono4.wav");
t5 = wavread("Tono5.wav");
t6 = wavread("Tono6.wav");
t7 = wavread("Tono7.wav");


l1 = length(t1);
l2 = length(t2);
l3 = length(t3);
l4 = length(t4);
l5 = length(t5);
l6 = length(t6);
l7 = length(t7);

largo_max = max([l1,l2,l3,l4,l5,l6,l7])

%Formo las señales correspondientes a cada uno de los botones para poder hacer el producto interno
%Frecuencias en x
Fx1=697;
Fx2=770;
Fx3=852;
Fx4=941;
%Frecuencias en y
Fy1=1209;
Fy2=1336;
Fy3=1477;

fase = 0;
A=3;
t_ini = 0;
t_fin = largo_max;

%Formo las senoidales
[t,fx1] = senoidal(Fm,Fx1,fase,t_ini,t_fin,A);
[t,fx2] = senoidal(Fm,Fx2,fase,t_ini,t_fin,A);
[t,fx3] = senoidal(Fm,Fx3,fase,t_ini,t_fin,A);
[t,fx4] = senoidal(Fm,Fx4,fase,t_ini,t_fin,A);
[t,fy1] = senoidal(Fm,Fy1,fase,t_ini,t_fin,A);
[t,fy2] = senoidal(Fm,Fy2,fase,t_ini,t_fin,A);
[t,fy3] = senoidal(Fm,Fy3,fase,t_ini,t_fin,A);

num = zeros(12,largo_max);
%Formo los numeros
for i = 1:largo_max
	num(1,i) = fx1(i) + fy1(i);%numero 1
endfor
for i = 1:largo_max
	num(2,i) = fx1(i) + fy2(i);%numero 2
endfor
for i = 1:largo_max
	num(3,i) = fx1(i) + fy3(i);%numero 3
endfor
for i = 1:largo_max
	num(4,i) = fx2(i) + fy1(i);%numero 4
endfor
for i = 1:largo_max
	num(5,i) = fx2(i) + fy2(i);%numero 5
endfor
for i = 1:largo_max
	num(6,i) = fx2(i) + fy3(i);%numero 6
endfor
for i = 1:largo_max
	num(7,i) = fx3(i) + fy1(i);%numero 7
endfor
for i = 1:largo_max
	num(8,i) = fx3(i) + fy2(i);%numero 8
endfor
for i = 1:largo_max
	num(9,i) = fx3(i) + fy3(i);%numero 9
endfor
for i = 1:largo_max
	num(10,i) = fx4(i) + fy1(i);%asterisco
endfor
for i = 1:largo_max
	num(11,i) = fx4(i) + fy2(i);%numero 0
endfor
for i = 1:largo_max
	num(12,i) = fx4(i) + fy3(i);%cardinal
endfor
%Comparo el producto interno de todos con todos y me quedo con el menor que seria en discado

res1=0;
res2=0;
res3=0;
res4=0;
res5=0;
res6=0;
res7=0;


%Tono 1
d1 = 999999999;
for i = 1:12
	if (dot(t1,num(i,1:l1)) < d1)
		d1 = dot(t1,num(i,1:l1));
		res1 = i;
	endif
endfor

%Tono 2
d2 = 999999999;
for i = 1:12
	if (dot(t2,num(i,1:l2)) < d2)
		d2 = dot(t2,num(i,1:l2));
		res2 = i;
	endif
endfor

%Tono 3
d3 = 999999999;
for i = 1:12
	if (dot(t3,num(i,1:l3)) < d3)
		d3 = dot(t3,num(i,1:l3));
		res3 = i;
	endif
endfor

%Tono 4
d4 = 999999999;
for i = 1:12
	if (dot(t4,num(i,1:l4)) < d4)
		d4 = dot(t4,num(i,1:l4));
		res4 = i;
	endif
endfor

%Tono 5
d5 = 999999999;
for i = 1:12
	if (dot(t5,num(i,1:l5)) < d5)
		d5 = dot(t5,num(i,1:l5));
		res5 = i;
	endif
endfor

%Tono 6
d6 = 999999999;
for i = 1:12
	if (dot(t6,num(i,1:l6)) < d6)
		d6 = dot(t6,num(i,1:l6));
		res6 = i;
	endif
endfor

%Tono 7
d7 = 999999999;
for i = 1:12
	if (dot(t7,num(i,1:l7)) < d7)
		d7 = dot(t7,num(i,1:l7));
		res7 = i;
	endif
endfor

%2428265 Es el numero de telefono

disp("El primer tono es");
disp(res1);
disp("El segundo tono es");
disp(res2);
disp("El tercer tono es");
disp(res3);
disp("El cuarto tono es");
disp(res4);
disp("El quinto tono es");disp(res5);
disp("El sexto tono es");
disp(res6);
disp("El septimo tono es");
disp(res7);
