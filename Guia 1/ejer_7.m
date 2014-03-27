%Inicializacion de parametros

tolerancia = 0.002;
t_ini = 0;
t_fin = 1;
media_ref = 0;
varianza_ref = 1;

%--------------------Prueba 0

disp("Prueba 0");

Fm = 500;% Cantidad de muestras
n = 500;% Cantidad de Realizaciones
f = n;
c = Fm;

%vector de n señales aleatorias con length(t) muestras
mats0 = randn(n,Fm);%media 0 varianza 1 por defecto


%Verifico Estacionariedad
[me,va] = calculos_med_var_est(mats0,c,f);

if (abs(media_ref - me) < tolerancia && abs(varianza_ref - va) < tolerancia)
	disp("Verifica Estacionariedad");
	disp("Media Est"), disp(me);
	disp("Varianza Est"), disp(va);
	
	%Verifico Ergodicidad
	[me2,va2] = calculos_med_var_erg(mats0,f,c);
	
	% Faltria controlar los otros extremos o con el abs alcanza??
	if (abs(me - me2) < (media_ref + tolerancia) && abs(va - va2) < (varianza_ref + tolerancia) )
		disp("Verifica Ergodicidad");
		disp("Media Erg"), disp(me2);
		disp("Varianza Erg"), disp(va2);
	else
		disp("No Verifica Ergodicidad");
	endif
else
	disp("No Verifica Estacionariedad");
endif


