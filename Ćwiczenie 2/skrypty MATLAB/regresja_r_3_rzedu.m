x=-20:00;
noise=80*(rand(1,21)-0.5);
y=0.1*(x.*x.*x)+1*(x.*x)-5*x+50;		%wartosci rzeczywiste
yp=y+noise;			%dodanie zaklocen
A=[(x.*x.*x)' (x.*x)' x' ones(21,1)];
b=yp';
z=pinv(A)*b;
ye=z(1)*(x.*x.*x)+z(2)*(x.*x)+z(3)*x+z(4);	%odtworzenie funkcji
plot(x,y,x,yp,'+',x,ye,'Linewidth',2);
hl=legend('idealna funkcja','zaszumione dane','zidentyfinowana funkcja');
set(hl,'FontSize',14);

ee=(yp-ye)*(yp-ye)'
ep=(yp-y)*(yp-y)'
