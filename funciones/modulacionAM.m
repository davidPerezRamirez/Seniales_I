[z, fs]=audioread('../señal moduladora/LaBaladaDelDiabloyLaMuerte.wav');
transpuesta = z(:,1)'; %La señal esta formada por señales superpuestas, se escoge una de ellas para analizar

%señal moduladora
sm = transpuesta(1:44101);

%señal portadora
f = 25;
fmuestreo=44100;
t = 1:1/fmuestreo:2; %vector tiempo
coseno = cos(2*pi*f*t);

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
t1 = 1:1/fmuestreo:14;
cantidadMuestras = 573301;
otraSm = transpuesta(1:cantidadMuestras); %señal moduladora

%Para portadora de baja frecuencia
fBaja = 0.1;
pfb  = cos(2*pi*fBaja*t1); %portadora 0.01 HZ
amFb = pfb.*otraSm; %señal modulada

%Grafico Señal de modulada - Portadora de frecuencia baja
figure('Name', 'Modulacion AM - Portadora de frecuencia baja')
title('Modulacion AM')
%Grafico Señal de audio 
subplot(3,1,1)
plot(t1, otraSm)
xlabel('Tiempo')
ylabel('Moduladora')
%Grafico de señal portadora
subplot(3,1,2)
plot(t1, pfb)
xlabel('Tiempo')
ylabel('Portadora')
%Grafico de señal modulada
subplot(3,1,3)
plot(t1, amFb)
xlabel('Tiempo')
ylabel('Modulada')

%Para portadora de alta frecuencia
fAlta = 500;
pfa  = cos(2*pi*fAlta*t1); %portadora 500 HZ
amFa = pfa.*otraSm; %señal modulada

%Grafico Señal de modulada - Portadora de frecuencia alta
figure('Name', 'Modulacion AM - Portadora de frecuencia alta')
title('Modulacion AM')
%Grafico Señal de audio 
subplot(3,1,1)
plot(t1, otraSm)
xlabel('Tiempo')
ylabel('Moduladora')
%Grafico de señal portadora
subplot(3,1,2)
plot(t1, pfa)
xlabel('Tiempo')
ylabel('Portadora')
%Grafico de señal modulada
subplot(3,1,3)
plot(t1, amFa)
xlabel('Tiempo')
ylabel('Modulada')
