%Cargo los parametros
Fm = 10000;
%bandas de transicion no mayores a 200 hz
%Para un  Band pass (Ws1<Wp1<Wp2<Ws2)
fr1=2300;
fp1=2500;
fp2=3000;
fr2=3200;
wp1=fp1*2/Fm;%Normalizo las frecuencias entre 0 y Fm/2
wp2=fp2*2/Fm;
wr1=fr1*2/Fm;
wr2=fr2*2/Fm;
epsilon = 0.7; %atenuacion maxima en la banda de paso
lambda = 55; %atenuacion minima en la banda de rechazo EN dBs!!!

%butterworth
figure(1);
%Para el filtro de butter el epsilon y el lambda deben ser negativos con epsilon > lambda
[n,wc] = buttord([wp1, wp2],[wr1, wr2],-1*epsilon,-1*lambda);
disp("El orden necesario para el Filtro de Butterworth es:"),disp(n);
[B,A] = butter(n,[wp1,wp2]);
freqz(B,A,Fm,0,Fm);
#[h1,w1] = freqz(B,A,Fm,0,Fm);
#plot(w1,abs(h1));

%chebyshev tipo 1
figure(2);
[n,wc] = cheb1ord([wp1, wp2],[wr1, wr2],epsilon,lambda);
disp("El orden necesario para el Filtro de Chebyshev I es:"),disp(n);
[B,A] = cheby1(n,0.5,[wp1,wp2]);% 0.5 es la amplitud de los ripples en la banda de paso
freqz(B,A,Fm,0,Fm);
#[h2,w2] = freqz(B,A,Fm,0,Fm);
#plot(w2,abs(h2));

%chebyshev tipo 2
figure(3);
[n,wc] = cheb2ord([wp1, wp2],[wr1, wr2],epsilon,lambda);
disp("El orden necesario para el Filtro de Chebyshev II es:"),disp(n);
[B,A] = cheby2(n,55,[wp1,wp2]);% 55 es la amplitud de los ripples en la banda de rechazo
freqz(B,A,Fm,0,Fm);
#[h3,w3] = freqz(B,A,Fm,0,Fm);
#plot(w3,abs(h3));

%eliptico
figure(4);
[n,wc] = ellipord([wp1, wp2],[wr1, wr2],epsilon,lambda);
disp("El orden necesario para el Filtro Eliptico es:"),disp(n);
[B,A] = ellip(n,0.5,55,[wp1,wp2]);% 0.5 es la amplitud de los ripples en la banda de paso y 55 en la de rechazo
freqz(B,A,Fm,0,Fm);
#[h4,w4] = freqz(B,A,Fm,0,Fm);
#plot(w4,abs(h4));
