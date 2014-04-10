%Ejercicio 2
Fm = 100;
t_ini = 0;
t_fin = 1;
T=1/Fm;
t=t_ini:T:t_fin-T;
%Amplitud 1 en todas
a=sin(2*pi*2*t);
b=square(t*2*2*pi);
c=sin(2*pi*4*t);

% 1 Verifico ortogonalidad en dominio temporal

disp("En el dominio Temporal");
verif_ortogonalidad(a,b);
verif_ortogonalidad(a,c);%deberia ser ortogonal
verif_ortogonalidad(b,c);

% 2 Verifico ortogonalidad en dominio frecuencial

af = fft(a);
bf = fft(b);
cf = fft(c);

disp("En el dominio Frecuencial");
verif_ortogonalidad(af,bf);
verif_ortogonalidad(af,cf);%deberia ser ortogonal
verif_ortogonalidad(bf,cf);

% Cambiando c y verificando en ambos dominios

disp("Cambiando C");

disp("    En el dominio Temporal");
c2=sin(2*pi*3.5*t);

verif_ortogonalidad(a,c2);

cf2=fft(c2);

disp("    En el dominio Frecuencial");

verif_ortogonalidad(af,cf2);

% La frecuencia de muestreo es clave porque si no tengo una frecuencia de muestreo que me garantice que una armonico es verdaderamente un multiplo de la fundamental entonces ya no me va a dar cero el producto interno que es lo que esta pasando aca.
