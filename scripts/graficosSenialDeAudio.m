%Graficos señal de audio
muestras = 617400;
tsa = 1:1/44100:15;
tsa = tsa(1:617400);

figure('Name', 'Señal de audio')
subplot(2,1,1);
plot(tsa,data);
xlabel('tiempo');ylabel('señal en tiempo');
subplot(2,1,2);
plot(abs(fft(data)));
xlabel('frecuencia');ylabel('espectro de frecuencias');