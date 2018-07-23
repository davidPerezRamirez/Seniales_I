[z, fs]=audioread('../señal moduladora/LaBaladaDelDiabloyLaMuerte.wav');
transpuesta = z(:,1)'; % La señal esta formada por señales superpuestas, 
                       % se escoge una de ellas para analizar
%señal portadora
f = 25;
fmuestreo=44100;
t = 1:1/fmuestreo:2; %vector tiempo
t = t(1:fmuestreo);
coseno = cos(2*pi*f*t);

%señal moduladora
sm = transpuesta(1:fmuestreo);

%modulacion
am = sm.*coseno;

%Grafico
figure('Name', 'Modulacion AM')
%Grafico Señal de audio 
subplot(3,1,1)
plot(t, sm)
xlabel('Tiempo')
ylabel('Moduladora')
%Grafico de señal portadora
subplot(3,1,2)
plot(t, coseno)
xlabel('Tiempo')
ylabel('Portadora')
%Grafico de señal modulada
subplot(3,1,3)
plot(t, am)
xlabel('Tiempo')
ylabel('Modulada')

%Se definen dos portadoras una frecuencia alta y otra de frecuencia baja
t1 = 1:1/fmuestreo:15;
cantidadMuestras = 617400;
t1 = t1(1:cantidadMuestras);
otraSm = transpuesta(1:cantidadMuestras); %señal moduladora

%Para portadora de baja frecuencia
fBaja = 0.1;
pfb  = cos(2*pi*fBaja*t1); %portadora 0.01 HZ
amFb = pfb.*otraSm; %señal modulada

%Grafico Señal de modulada - Portadora de frecuencia baja
figure('Name', 'Modulacion AM - Portadora de frecuencia baja')
title('Modulacion AM')
%Grafico Señal de audio 
subplot(4,1,1)
plot(t1, otraSm)
xlabel('Tiempo')
ylabel('Moduladora')
%Grafico de señal portadora
subplot(4,1,2)
plot(t1, pfb)
xlabel('Tiempo')
ylabel('Portadora')
%Grafico de señal modulada
subplot(4,1,3)
plot(t1, amFb)
xlabel('Tiempo')
ylabel('Modulada - tiempo')
subplot(4,1,4)
plot(abs(fft(amFb)))
xlabel('frecuencia')
ylabel('Modulada - frecuencia')

%Para portadora de alta frecuencia
fAlta = 3000;
pfa  = cos(2*pi*fAlta*t1); %portadora 3000 HZ
amFa = pfa.*otraSm; %señal modulada

%Grafico Señal de modulada - Portadora de frecuencia alta
figure('Name', 'Modulacion AM - Portadora de frecuencia alta')
title('Modulacion AM')
%Grafico Señal de audio 
subplot(4,1,1)
plot(t1, otraSm)
xlabel('Tiempo')
ylabel('Moduladora')
%Grafico de señal portadora
subplot(4,1,2)
plot(t1, pfa)
xlabel('Tiempo')
ylabel('Portadora')
%Grafico de señal modulada
subplot(4,1,3)
plot(t1, amFa)
xlabel('Tiempo')
ylabel('Modulada tiempo')
subplot(4,1,4)
plot(abs(fft(amFa)))
xlabel('frecuencia')
ylabel('Modulada frecuencia')
