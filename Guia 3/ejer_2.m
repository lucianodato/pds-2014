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
verif_ortogonalidad(a,a);
verif_ortogonalidad(a,c);
verif_ortogonalidad(b,c);

% 2 Verifico ortogonalidad en dominio frecuencial

af = fftp(a);
bf = fftp(b);
cf = fftp(c);

disp("En el dominio Frecuencial");
verif_ortogonalidad(af,bf);
verif_ortogonalidad(af,cf);
verif_ortogonalidad(bf,cf);

% Cambiando c y verificando en ambos dominios

disp("Cambiando C");

disp("    En el dominio Temporal");
c2=sin(2*pi*3.5*t);

verif_ortogonalidad(a,c2);

cf2=fftp(c2);

disp("    En el dominio Frecuencial");

verif_ortogonalidad(af,cf2);

%Ninguno es ortogonal porque no son base y por lo tanto no son conjunto generador linealmente independiente???
