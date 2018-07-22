%Demodulación mediante filtro pasa bajos
fc = 500;
fs = 44100;
t = 1:1/44100:14; 
cantidadMuestras = 573301;

[num, den] = butter(10,fc*2/fs);%Creacion de filtro pasa bajos
demodulacion = amdemod(amFa, fc, fs, 0, 0, num, den);
%sound(demodulacion, fs);
subplot(2,1,1)
plot(t, demodulacion);
hold on;
ylabel('Demodulacion'); xlabel('frecuencia');
subplot(2,1,2)
plot(t, transpuesta(1:cantidadMuestras));
ylabel('Señal orginal'); xlabel('frecuencia');
hold off;