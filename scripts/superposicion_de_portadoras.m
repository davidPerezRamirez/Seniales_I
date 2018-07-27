N=length(data);
dataR=data(1:N,1); %canal derecho
dataL=data(1:N,2); % canal izquierdo

f = 0:fs/N: fs - fs/N; % escala f


t=0:1/fs:(N/fs)-(1/fs);% escala t

fm1=6000; 
m1 = cos(2*pi*fm1*t);% señal portadora 1

fm2=22000;
m2 = cos(2*pi*fm2*t); % señal portadora 2

sm1=dataR.*(m1'); % señal modulada 1
sm2=dataR.*(m2'); % señal modulada 2

SM1=abs(fft(sm1));  % espectro señal modulada 1
SM2=abs(fft(sm2)); % espectro señal modulada 2

figure('Name', 'Superposicion de portadoras')
plot(f, SM1,'DisplayName','SM1');
xlabel('frecuencia')
hold on;
plot(f,SM2,'DisplayName','SM2');
xlabel('frecuencia')
hold off;
