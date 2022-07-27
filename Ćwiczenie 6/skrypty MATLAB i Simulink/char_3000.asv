%Table of acquisition for 3000F
Tab=[
     0.001 8000 1250
     0.002 4000 1250
     0.004 2000 1250
     0.008 1000 1250
     0.01 800 1250
     0.02 400 1250
     0.04 200 1250
     0.1 80 1250
     0.2 40 1250 
     0.4 20 1250
     1 8 1250
     4 2 1250
     ];
 
[n,m]=size(Tab);
 
F=[];
A=[];
w=[];
P=[];
Q=[];
 
for k=1:n  
 load(['freq-90A\' num2str(Tab(k,1)) '.mat'] );
 S_uc=fsa(data(1,:),0.1,0);
 S_i=fsa(data(2,:),0.1,0);
 di=S_i.pha(1)-S_uc.pha(1);
 F=[F di];
 modi=10*(S_i.amp(1));   % module of the current (input of ultracapacitor)
 moduc=10*(S_uc.amp(1)); % module of the voltage on ultracapacitor (output)
 A=[A 20*log10(moduc/modi)];
  w=[w 2*pi*Tab(k,1)];
end

% options = optimset('MaxFunEvals',1080);
x=fminsearch(@(x) funkcja_celu_kondziol(x,w,A,F),[1 1 1]);
C=x(1);
R=x(2);
% T=x(3);
alpha=x(3);

Am=[];
Fm=[];
for ww=w
% Gw=R+(1/(C*1i*ww));                   %model tradycyjny, zmien f. celu
% Gw=R+(sqrt(R*C*1i*ww+1)/(C*1i*ww));   %model Davidsona-Cola, zmien f. celu
Gw=R+(sqrt(R*C*((1i*ww)^alpha)+1)/(C*(1i*ww)^alpha)); %model oparty na dyfuzji
Am=[ Am 20*log10(abs(Gw))];
Fm=[Fm angle(Gw)*180/pi];
end


%% Ploting of bode diagrams %%

figure
subplot(2,1,1)
semilogx(w,A,w,Am,'LineWidth',3);
hl=legend('Char. logarytmiczna dopasowanego modelu', 'Char. logarytmiczna zmierzona');
set(hl,'FontSize',14);
hxl=xlabel('Frequency (rad/s)');
set(hxl,'FontSize',14);
hyl=ylabel('20log(A(\omega)) (dB)');
set(hyl,'FontSize',14);

subplot(2,1,2)
semilogx(w,F,w,Fm,'LineWidth',3)
hl=legend('Char. logarytmiczna dopasowanego modelu', 'Char. logarytmiczna zmierzona');
set(hl,'FontSize',14);
hxl=xlabel('Frequency (rad/s)');
set(hxl,'FontSize',14);
hyl=ylabel('arg(G(j\omega)) (°)');
set(hyl,'FontSize',14);


