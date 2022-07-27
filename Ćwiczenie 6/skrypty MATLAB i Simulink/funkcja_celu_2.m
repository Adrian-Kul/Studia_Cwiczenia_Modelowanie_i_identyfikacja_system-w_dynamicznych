function e=funkcja_celu_2(x,w,Ap,Fp)
T=x(1);
e=0;
Am=[];
Fm=[];
for ww=w
Gw=1/( T*1i*ww +1);
Am=[ Am 20*log10(abs(Gw))];
Fm=[Fm angle(Gw)*180/pi];

    
end

e=(Ap-Am)*(Ap-Am)'+(Fp-Fm)*(Fp-Fm)';
