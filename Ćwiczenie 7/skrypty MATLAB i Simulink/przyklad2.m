
n=2;
Xc=num2cell(u'); % X wektor danych wej�ciowe uk�adu (To workspace z Simulinka) 
Tc=num2cell(y'); % T wektor danych wyj�ciowych uk�adu (To workspace z Simulinka)
net = narxnet(1:n,1:n,5); % konfiguracja sieci 
[Xs,Xi,Ai,Ts] = preparets(net,Xc,{},Tc); % przygotowanie danych dla uczenia sieci
 net.trainFcn = 'trainlm'; % okre�lenie algorytmu uczenia
net = train(net,Xs,Ts,Xi,Ai); % uczenie sieci
view(net) % pokazanie struktury sieci
yn_cell = net(Xs,Xi,Ai); % symulacja sieci na podane dane 
perf = perform(net,Ts,yn_cell)% wyznaczenie efektywno�ci naucenia sieci
yn=[yn_cell{:}];
net = closeloop(net); % przekonfigurowanie sieci dla po��czenia wy�cia sieci z odpowiadaj�cym mu wej�ciem 
[Xs,Xi,Ai] = preparets(net,Xc,{},Tc); % przygotowanie danych dla danej sieci
ync_cell = net(Xs,Xi,Ai); % symulacja dzia�ania sieci
ync=[ync_cell{:}]; %zamiana z cell na liczby


tt=t((n+1):end); %czas dla wykres�w 
figure(1)
plot(t,y,tt,yn,'LineWidth',2)
hl=legend('dane ucz�ce','odpowied� sieci na dane ucz�ce');
set(hl,'FontSize',14);
figure(2)
plot(y((n+1):end)'-yn,'LineWidth',2)
hl=legend('b��d odpowiedzi sieci');
set(hl,'FontSize',14);

figure(3)
plot(t,y,tt,ync,'LineWidth',2)
hl=legend('dane ucz�ce','odpowied� sieci w p�tli zamkni�tej');
set(hl,'FontSize',14);
figure(4)
plot(y((n+1):end)'-ync,'LineWidth',2)
hl=legend('b��d odpowiedzi sieci w p�tli zamkni�tej');
set(hl,'FontSize',14);





