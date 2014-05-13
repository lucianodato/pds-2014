%Version sin escalado de Ventana

%Cargo los parametros
Fm = 300;
T = 1/Fm;
fact_df = 10; %Factor que aumenta la definicion frecuencial
ventana = 2; %0 - Cuadrada / 1 - Hanning / 2 - Blackman
tam_ventana = 50; %La ventana que aplico sobre la sinc (solo la parte positiva) La ventana total es esto *2


%En primera instancia defino la respuesta en frecuencia del filtro con la posibilidad de aumentar la definicion frecuencial dinamicamente. Hay que tener en cuenta el espectro positivo y negativo

f1 = 45*fact_df;
f2 = 55*fact_df;

%Necesito establecer que frecuencias van a valer 1 y cuales 0
N = fact_df*Fm/2; %Frecuencia de nyquist escalada por el factor
Hz(1:f1-1) = 1;
Hz(f1:f2) = 0;
Hz(f2+1:N) = 1;
Hz = [Hz(N:-1:1) Hz(1:1:N)]; %Creo la parte negativa espejando la positiva

figure(1,"name","Respuesta en frecuencia esperada");
paso_escalado = 1/fact_df; %Para que no cambie el vector de frecuencias
frec = -Fm/2:paso_escalado:Fm/2-paso_escalado; %Vector de frecuencias
plot(frec,Hz);

%Antitransformo 
at=real(ifft(Hz));
Nat = length(at);
medio = floor(Nat/2);
at=[at(medio:Nat) at(1:medio-1)];%Acomodo la parte negativa
figure(2,"name","Antitransformada de Hz")
plot(at);

%Aplico una ventana
%Ahora me quedo con la parte significativa que son las 300 muestras desde el centro
%Esro es lo mismo que aplicar una ventana cuadrada (Paso que debo hacer si o si)
Fil_vent = [at(medio-tam_ventana+1:medio) at(medio+1:medio+tam_ventana)]; %Claramente se ven los ripples

%Aplico ventana si se utiliza una que no sea cuadrada
switch(ventana)
	case 1
		vh = hanning(2*tam_ventana);%Genera una ventana de hanning de 2*tam_ventana muestras (parte + y -)
		vh = vh';%La transpongo porque la saca en forma de columna
		Fil_vent = Fil_vent.*vh;%multiplico elemento a elemento la ventana cuadrada 
	case 2
		vb = blackman(2*tam_ventana);%Genera una ventana de hanning de 2*tam_ventana muestras 
		vb = vb';%La transpongo porque la saca en forma de columna
		Fil_vent = Fil_vent.*vb;%multiplico elemento a elemento la ventana cuadrada 
endswitch

%En el caso de que tenga una ventana con tamaño diferente al de la frecuencia de muestreo deberia agregar los ceros
%que falten para tener la respuesta en frecuencia adecuada

Fil_vent = [Fil_vent zeros(1,Fm - length(Fil_vent))];

%Vuelvo a tranformar y grafico la respuesta en frecuencia
res_fil = fft(Fil_vent);
figure(3,"name","Respuesta en frecuencia del filtro final");
plot(-Fm/2:1:Fm/2-1,abs(res_fil));

