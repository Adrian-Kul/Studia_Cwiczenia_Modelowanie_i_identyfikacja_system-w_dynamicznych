
n=2;
Xc=num2cell(u'); % X wektor danych wejœciowe uk³adu (To workspace z Simulinka) 
Tc=num2cell(y'); % T wektor danych wyjœciowych uk³adu (To workspace z Simulinka)
net = narxnet(1:n,1:n,5); % konfiguracja sieci 
[Xs,Xi,Ai,Ts] = preparets(net,Xc,{},Tc); % przygotowanie danych dla uczenia sieci
 net.trainFcn = 'trainlm'; % okreœlenie algorytmu uczenia
net = train(net,Xs,Ts,Xi,Ai); % uczenie sieci
view(net) % pokazanie struktury sieci
yn_cell = net(Xs,Xi,Ai); % symulacja sieci na podane dane 
perf = perform(net,Ts,yn_cell)% wyznaczenie efektywnoœci naucenia sieci
yn=[yn_cell{:}];
net = closeloop(net); % przekonfigurowanie sieci dla po³¹czenia wyœcia sieci z odpowiadaj¹cym mu wejœciem 
[Xs,Xi,Ai] = preparets(net,Xc,{},Tc); % przygotowanie danych dla danej sieci
ync_cell = net(Xs,Xi,Ai); % symulacja dzia³ania sieci
ync=[ync_cell{:}]; %zamiana z cell na liczby


tt=t((n+1):end); %czas dla wykresów 
figure(1)
plot(t,y,tt,yn,'LineWidth',2)
hl=legend('dane ucz¹ce','odpowiedŸ sieci na dane ucz¹ce');
set(hl,'FontSize',14);
figure(2)
plot(y((n+1):end)'-yn,'LineWidth',2)
hl=legend('b³¹d odpowiedzi sieci');
set(hl,'FontSize',14);

figure(3)
plot(t,y,tt,ync,'LineWidth',2)
hl=legend('dane ucz¹ce','odpowiedŸ sieci w pêtli zamkniêtej');
set(hl,'FontSize',14);
figure(4)
plot(y((n+1):end)'-ync,'LineWidth',2)
hl=legend('b³¹d odpowiedzi sieci w pêtli zamkniêtej');
set(hl,'FontSize',14);





