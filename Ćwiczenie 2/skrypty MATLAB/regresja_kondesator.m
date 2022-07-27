t=[0 1 2 3 4 5 6 7]; 
Uc=[100 75 55 40 30 20 15 10];

A=[-t' ones(length(t),1)];
% u=real(log(Uc'));%zabezpieczenie przy ujemnym argumencie dla logarytmu (z wyniku bierzemy czêœæ rzeczywist¹
u=log(Uc');
z=pinv(A)*u;
a = z(1);
b = z(2);
Uo = exp(b);
time = linspace(t(1),t(end));

Uc_wykres = Uo*exp(-a*time);
plot(t,Uc,'+',time,Uc_wykres,'Linewidth',2);
hl=legend('zaszumione dane','zidentyfikowana funkcja')
set(hl,'FontSize',14);

Uce= Uo*exp(-a*t);
ee=(Uc-Uce)*(Uc-Uce)'
