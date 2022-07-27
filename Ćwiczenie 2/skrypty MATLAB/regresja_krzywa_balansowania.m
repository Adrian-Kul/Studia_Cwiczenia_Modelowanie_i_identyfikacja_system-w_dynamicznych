clear all
V_wart=[80 90 100 110 120 140 160 180 200]; 
kat_wart=[-3.733 -2.967 -2.267 -1.65 -1.35 -0.633 -0.117 0.167 0.583];
n = [8 12 11 9 14 6 9 12 10];
kat=[];
V=[];
for i = 1:length(n)
    kat=[kat kat_wart(i).*ones(1,n(i))];
    V = [V V_wart(i).*ones(1,n(i))];
end

A=[ones(length(V),1) (1./(V.*V))'];
b=kat';
z=pinv(A)*b;
kat_e = z(1) + z(2)./(V.*V);
plot(V,kat,'+',V,kat_e,'Linewidth',2);
hl=legend('zaszumione dane','zidentyfikowana funkcja')
set(hl,'FontSize',14);

ee=(kat-kat_e)*(kat-kat_e)'



