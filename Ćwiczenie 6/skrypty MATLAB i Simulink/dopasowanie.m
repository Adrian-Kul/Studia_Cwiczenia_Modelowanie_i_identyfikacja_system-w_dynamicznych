

w= [0.2 0.5 1 2 4 8 10 20 40 100];
Ap=[ -0.01 -0.01 -0.04 -0.2 -0.7 -2 -3 -7  -12 -18 ];
Fp=[ -2 -4 -6 -12 -20 -35 -44 -65 -75 -82];

x=fminsearch(@(x) funkcja_celu_2(x,w,Ap,Fp),[1]);
T=x(1);
Am=[];
Fm=[];
for ww=w
Gw=1/( T*1i*ww +1);
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
