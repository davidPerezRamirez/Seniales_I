%Demodulación
fc = 3000;
fs = 44100;

demodulacion = amdemod(amFa, fc, fs);

td = 1:1/fs:2;
muestras = fs;
td = td(1:muestras);
figure('Name', 'Demodulación de señal');
subplot(3,1,1)
plot(td, amFa(1:muestras));
ylabel('Señal modulada'); xlabel('tiempo');
subplot(3,1,2)
plot(td, demodulacion(1:muestras));
ylabel('Señal demodulada'); xlabel('tiempo');
subplot(3,1,3)
plot(td, transpuesta(1:muestras));
ylabel('Señal orginal'); xlabel('tiempo');


figure('Name', 'Demodulación de señal- espectro frecuencia');
subplot(3,1,1)
plot(abs(fft(amFa(1:muestras))));
ylabel('Señal modulada'); xlabel('frecuencia');
subplot(3,1,2)
plot(abs(fft(demodulacion(1:muestras))));
ylabel('Señal demodulada'); xlabel('frecuencia');
subplot(3,1,3)
plot(abs(fft(transpuesta(1:muestras))));
ylabel('Señal orginal'); xlabel('frecuencia');