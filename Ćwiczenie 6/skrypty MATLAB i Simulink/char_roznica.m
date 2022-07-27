

w = [0.2 0.5 1 2 4 8 10 20 40 100];
Ts = 2*pi./w;
A = [0.021 0.045 0.108 0.202 0.372 0.619 0.695 0.898 0.97 0.985];
Ap = 20*log10(A);
% Tk = [8.2 3.23 1.44 0.701 0.299 .099 .077 .0285 .00627 .001];
% Fp = 360*Tk./Ts;
Fp = [94 93 83 80 68 45 44 33 14 6];

% Ap=[ -0.01 -0.01 -0.04 -0.2 -0.7 -2 -3 -7  -12 -18 ];

x=fminsearch(@(x) funkcja_celu_roznica(x,w,Ap,Fp),[1]);
T=x(1);
Am=[];
Fm=[];
for ww=w
Gw=(T*1i*ww)/(T*1i*ww +1);
Am=[ Am 20*log10(abs(Gw))];
Fm=[Fm angle(Gw)*180/pi];

    
end


subplot(2,1,1)
semilogx(w,Am,w,Ap,'LineWidth',2)
hl=legend('Charakterystyka logarytmiczna dopasowanego modelu', 'Charakterystyka logarytmiczna zmierzona');
set(hl,'FontSize',14);
hxl=xlabel('Pulsacja [rad/s]');
set(hxl,'FontSize',14);
hyl=ylabel('20log(A(\omega)) (dB)');
set(hyl,'FontSize',14);

subplot(2,1,2)
semilogx(w,Fm,w,Fp,'LineWidth',2)
hl=legend('Charakterystyka logarytmiczna dopasowanego modelu', 'Charakterystyka logarytmiczna zmierzona');
set(hl,'FontSize',14);
hxl=xlabel('Pulsacja [rad/s]');
set(hxl,'FontSize',14);
hyl=ylabel('arg(G(j\omega)) [°]');
set(hyl,'FontSize',14);
