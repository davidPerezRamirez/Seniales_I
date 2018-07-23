[z, fs]=audioread('../se�al moduladora/LaBaladaDelDiabloyLaMuerte.wav');
transpuesta = z(:,1)'; % La se�al esta formada por se�ales superpuestas, 
                       % se escoge una de ellas para analizar
%se�al portadora
f = 25;
fmuestreo=44100;
t = 1:1/fmuestreo:2; %vector tiempo
t = t(1:fmuestreo);
coseno = cos(2*pi*f*t);

%se�al moduladora
sm = transpuesta(1:fmuestreo);

%modulacion
am = sm.*coseno;

%Grafico
figure('Name', 'Modulacion AM')
%Grafico Se�al de audio 
subplot(3,1,1)
plot(t, sm)
xlabel('Tiempo')
ylabel('Moduladora')
%Grafico de se�al portadora
subplot(3,1,2)
plot(t, coseno)
xlabel('Tiempo')
ylabel('Portadora')
%Grafico de se�al modulada
subplot(3,1,3)
plot(t, am)
xlabel('Tiempo')
ylabel('Modulada')

%Se definen dos portadoras una frecuencia alta y otra de frecuencia baja
t1 = 1:1/fmuestreo:15;
cantidadMuestras = 617400;
t1 = t1(1:cantidadMuestras);
otraSm = transpuesta(1:cantidadMuestras); %se�al moduladora

%Para portadora de baja frecuencia
fBaja = 0.1;
pfb  = cos(2*pi*fBaja*t1); %portadora 0.01 HZ
amFb = pfb.*otraSm; %se�al modulada

%Grafico Se�al de modulada - Portadora de frecuencia baja
figure('Name', 'Modulacion AM - Portadora de frecuencia baja')
title('Modulacion AM')
%Grafico Se�al de audio 
subplot(4,1,1)
plot(t1, otraSm)
xlabel('Tiempo')
ylabel('Moduladora')
%Grafico de se�al portadora
subplot(4,1,2)
plot(t1, pfb)
xlabel('Tiempo')
ylabel('Portadora')
%Grafico de se�al modulada
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
amFa = pfa.*otraSm; %se�al modulada

%Grafico Se�al de modulada - Portadora de frecuencia alta
figure('Name', 'Modulacion AM - Portadora de frecuencia alta')
title('Modulacion AM')
%Grafico Se�al de audio 
subplot(4,1,1)
plot(t1, otraSm)
xlabel('Tiempo')
ylabel('Moduladora')
%Grafico de se�al portadora
subplot(4,1,2)
plot(t1, pfa)
xlabel('Tiempo')
ylabel('Portadora')
%Grafico de se�al modulada
subplot(4,1,3)
plot(t1, amFa)
xlabel('Tiempo')
ylabel('Modulada tiempo')
subplot(4,1,4)
plot(abs(fft(amFa)))
xlabel('frecuencia')
ylabel('Modulada frecuencia')
