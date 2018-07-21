%Demodulación mediante filtro pasa bajos

fc = 3000;
fs = 44100;

[num, den] = butter(10,fc/(fs/2));
demodulacion = amdemod(amFa, fc, fs, 0, 0, num, den);
sound(demodulacion, fs);
plot(demodulacion);