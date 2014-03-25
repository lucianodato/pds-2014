%Inicializacion de parametros

t_ini = 0;
t_fin = 1;
Fm = 10;
T = 1/Fm;
t = t_ini:T:t_fin - T;
%n es el numero de señales aleatorias
n = 10;
%vector de n señales aleatorias con length(t) muestras
mats = randn(n,length(t));%media 0 varianza 1 por defecto

%Compruebo estacionariedad
for i = 1:n
	tg = zeros(1,length(t));
	
	for j = 1:length(t)
		tg(j) = mats(i,j);%devuelve la señal de la matriz mats fila i
	endfor
	
	%Calculo la media
	disp ("Valor Medio"),disp(median(tg));
	%Calculo la varianza
	disp("Varianza"),disp(var(tg));
	
	%Grafico
	hold on;
	hist(tg);
endfor

<<<<<<< HEAD
%Compruebo ergodicidad
for i = 1:length(t)
	tg = zeros(1,n);
	for j = 1:n
		tg(j) = mats(j,i);%devuelve la señal de la matriz mats fila i
	endfor
	subplot(length(t),n,i);
	hist(tg);
endfor
=======
#%Compruebo ergodicidad
#for i = 1:length(t)
#	tg = zeros(1,n);
#	for j = 1:n
#		tg(j) = mats(j,i);%devuelve la señal de la matriz mats fila i
#	endfor
#	subplot(length(t),n,i);
#	hist(tg);
#endfor
>>>>>>> 32c9983867a116903b9e8bee4c14cf10eb810494

