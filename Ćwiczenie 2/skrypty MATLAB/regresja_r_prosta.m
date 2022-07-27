ilosc = 20;
x=0:ilosc;
noise=1*(rand(1,(ilosc+1))-0.5);
y=x-5;
yp=y+noise;
A=[x' ones((ilosc+1),1)];	%postaæ macierzy do równania prostej
b=yp';
z=pinv(A)*b;
ye=z(1)*x+z(2);
plot(x,y,x,yp,'+',x,ye,'Linewidth',2);
hl=legend('idealna funkcja','zaszumione dane','zidentyfinowana funkcja')
set(hl,'FontSize',14);
ee=(yp-ye)*(yp-ye)' %b³¹d estymacji
ep=(yp-y)*(yp-y)' %b³¹d danych

