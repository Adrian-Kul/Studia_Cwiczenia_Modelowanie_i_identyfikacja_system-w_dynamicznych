close all
x=-50:5:50;
y=0.1*x.^4+x.^3+2*x.^2+x+5;
noise=20*(rand(size(y))-0.5);
yp = y + noise;

net = fitnet(6);
net = train(net,x,yp);
view(net)
yn = net(x);
perf = perform(net,x,yn)
     
x2=-60:0.5:60;
y2=0.1*x2.^4+x2.^3+2*x2.^2+x2+5;
yn2 = net(x2);
     
figure
plot(x,yn,'b-',x,yp,'rx',x2,yn2,'g','LineWidth',2)
hl=legend('odpowiedü sieci na dane uczπce','dane uczπce','odpowiedü sieci na dane testowe');
set(hl,'FontSize',14);
figure
plot(x,yp-yn,x2,y2-yn2,'LineWidth',2)
hl=legend('b≥πd dla danych uczπcych','b≥πd dla danych testowych');
set(hl,'FontSize',14);