x=-100:10:100;
y=0.1*x.^3+2*x.^2-2*x+5;

net = fitnet(5);
net = train(net,x,y);
view(net)
yn = net(x);
perf = perform(net,x,yn)
     
x2=-130:1:130;
y2=0.1*x2.^3+2*x2.^2-2*x2+5;
yn2 = net(x2);
     
figure
plot(x,yn,'b-',x,y,'rx',x2,yn2,'g','LineWidth',2)
hl=legend('odpowied� sieci na dane ucz�ce','dane ucz�ce','odpowied� sieci na dane testowe');
set(hl,'FontSize',14);
figure
plot(x,y-yn,x2,y2-yn2,'LineWidth',2)
hl=legend('b��d dla danych ucz�cych','b��d dla danych testowych');
set(hl,'FontSize',14);