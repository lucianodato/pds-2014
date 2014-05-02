%Inicializacion de parametros

t_ini = 0;
t_fin = 1;
Fm = 100;
T=1/Fm;
fs_1 = 2;
fase = 0;
A = 1;

% ------- Original -------

%Senoidal 1
t=t_ini:T:t_fin-T;
s = A*sin(2*pi*fs_1*t+fase);
plot(t,s,'k');

disp("Valor medio"), disp(mean(s));
disp("Maximo"), disp(max(s));
disp("Minimo"), disp(min(s));
disp("Amplitud"), disp(max(abs(s)));%norma infinita o suprema de s
disp("Energia"), disp(norm(s,2)^2);
disp("Accion"), disp(norm(s,1));
disp("Potencia Media"), disp((norm(s,2)^2)/2*length(s));
disp("Raiz del valor Cuadratico Medio"), disp(((norm(s,2)^2)/2*length(s))^1/2);
