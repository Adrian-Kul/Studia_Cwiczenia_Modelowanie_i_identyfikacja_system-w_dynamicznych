st = 7;
figure(1)
plot(t(st:end),theta(:,1),t(st:end),theta(:,2),t(st:end),theta(:,3),t(st:end),theta(:,4),'Linewidth',2);
hl=legend('parametr a_0','parametr a_1','parametr b_0','parametr b_1');
set(hl,'FontSize',14);
figure(2)
plot(t(st:end),squeeze(P(1,1,:)),t(st:end),squeeze(P(2,2,:)),t(st:end),squeeze(P(3,3,:)),t(st:end),squeeze(P(4,4,:)),'Linewidth',2);
hl=legend('P(1,1)_k','P(2,2)_k','P(3,3)_k','P(4,4)_k');
set(hl,'FontSize',14);

