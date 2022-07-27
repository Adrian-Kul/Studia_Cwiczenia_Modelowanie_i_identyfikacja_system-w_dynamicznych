function e=funkcja_celu_roznica(x,w,Ap,Fp)
T=x(1);
e=0;
Am=[];
Fm=[];
for ww=w
Gw=(T*1i*ww)/(T*1i*ww +1);
Am=[ Am 20*log10(abs(Gw))];
Fm=[Fm angle(Gw)*180/pi];

    
end

e=(Ap-Am)*(Ap-Am)'+(Fp-Fm)*(Fp-Fm)';
