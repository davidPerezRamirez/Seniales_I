[z, fs]=audioread('LaBaladaDelDiabloyLaMuerte.wav');
transpuesta = z';

%se�al moduladora
sm = transpuesta(1:44101);

%se�al portadora
f = 25;
fmuestreo=44100;
t = 1:1/fmuestreo:2; %vector tiempo
coseno = cos(2*pi*f*t);

%modulacion
am = sm.*coseno;

%Grafico de se�al modulada
figure(1)
plot(am)
legend('y(t)=x(t)coseno(t)')
xlabel('frecuencia')
ylabel('Amplitud')
title('Se�al Modulada')

%Grafico Se�al de audio 
figure(2)
plot(z)
legend('x(t) = Se�al de audio')
xlabel('frecuencia')
ylabel('amplitud')
title('Se�al de audio')

%Se definen dos portadoras una frecuencia alta y otra de frecuencia baja
t1 = 1:1/fmuestreo:15;
otraSm = transpuesta(1:617401); %se�al moduladora

%Para portadora de baja frecuencia
fBaja = 0.1;
pfb  = cos(2*pi*fBaja*t1); %portadora 0.01 HZ
amFb = pfb.*otraSm; %se�al modulada

%Grafico Se�al de modulada - Portadora de frecuencia baja
figure(3)
plot(amFb)
xlabel('frecuencia')
ylabel('amplitud')
title('Se�al de madulada - Portadora de frecuencia baja')

%Para portadora de alta frecuencia
fAlta = 3000;
pfa  = cos(2*pi*fAlta*t1); %portadora 3000 HZ
amFa = pfa.*otraSm; %se�al modulada

%Grafico Se�al de modulada - Portadora de frecuencia alta
figure(4)
plot(amFa)
xlabel('frecuencia')
ylabel('amplitud')
title('Se�al de madulada - Portadora de frecuencia alta')
