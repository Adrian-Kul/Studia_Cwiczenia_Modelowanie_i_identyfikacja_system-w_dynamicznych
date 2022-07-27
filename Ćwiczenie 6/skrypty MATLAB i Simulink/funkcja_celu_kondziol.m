function e=funkcja_celu_kondziol(x,w,Ap,Fp)
C=x(1);
R=x(2);
% T=x(3);
alpha=x(3);
e=0;
Am=[];
Fm=[];
for ww=w
% Gw=R+(1/(C*1i*ww));               %model tradycyjny
% Gw=R+(sqrt(R*C*1i*ww+1)/(C*1i*ww)); %model Davidsona-Cola
Gw=R+(sqrt(R*C*((1i*ww)^alpha)+1)/(C*(1i*ww)^alpha)); %model oparty na dyfuzji
Am=[ Am 20*log10(abs(Gw))];
Fm=[Fm angle(Gw)*180/pi];
end

e=(Ap-Am)*(Ap-Am)'+(Fp-Fm)*(Fp-Fm)';
