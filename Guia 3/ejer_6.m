%Ejercicio 6

Fm = 250;
Fmemg = 1300;
T=1/Fm;
Temg=1/Fmemg;

%Cargo
ecg = load("ecg.txt");
eeg = load("eeg.txt");
emg = load("emg.txt");
presion = load("presion.txt");
respiracion = load("respiracion.txt");

%Saco la longitud
necg = length(ecg);
neeg = length(eeg);
nemg = length(emg);
npresion = length(presion);
nrespiracion = length(respiracion);

#%Genero los vectores de tiempo
#tecg=0:T:necg-T;
#teeg=0:T:neeg-T;
#temg=0:Temg:nemg-Temg;
#tpresion=0:T:npresion-T;
#trespiracion=0:T:nrespiracion-T;

%Calculo la variacion de frecuencias
dfecg=Fm/necg;
dfeeg=Fm/neeg;
dfemg=Fmemg/nemg;
dfpresion=Fm/npresion;
dfrespiracion=Fm/nrespiracion;

%Genero los vectores de frecuencia
freqecg=-Fm/2:dfecg:Fm/2-dfecg;
freqeeg=-Fm/2:dfeeg:Fm/2-dfeeg;
freqemg=-Fmemg/2:dfemg:Fmemg/2-dfemg;
freqpresion=-Fm/2:dfpresion:Fm/2-dfpresion;
freqrespiracion=-Fm/2:dfrespiracion:Fm/2-dfrespiracion;

%Calculo la transformada
fecg = fftp(ecg);
feeg = fftp(eeg);
femg = fftp(emg);
fpresion = fftp(presion);
frespiracion = fftp(respiracion);

%Graficos de tiempo
subplot(5,2,1);
plot(ecg);
subplot(5,2,3);
plot(eeg);
subplot(5,2,5);
plot(emg);
subplot(5,2,7);
plot(presion);
subplot(5,2,9);
plot(respiracion);

%Graficos de frecuencias
subplot(5,2,2);
plot(freqecg,fecg);
subplot(5,2,4);
plot(freqeeg,feeg);
subplot(5,2,6);
plot(freqemg,femg);
subplot(5,2,8);
plot(freqpresion,fpresion);
subplot(5,2,10);
plot(freqrespiracion,frespiracion);

