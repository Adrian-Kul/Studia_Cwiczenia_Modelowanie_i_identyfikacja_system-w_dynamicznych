% A = [0.99 0.095; -0.19 0.9];
figure(1)
plot(t,u,t,y,'Linewidth',2);
hl=legend('wymuszenie u_k','odpowiedŸ uk³adu y_k');
set(hl,'FontSize',14);
figure(2)
plot(t,x,t,x1e,'.',t,x2e,'.','Linewidth',2,'MarkerSize',12);
hl=legend('zmienna stanu x1_k','estymata zmiennej stanu x1_k','estymata zmiennej stanu x2_k');
set(hl,'FontSize',14);

figure(3)
plot(t,par,t,ones(size(t))*0.99,'Linewidth',2);
hl=legend('estymowany parametr a','zadana wartoœæ parametru a');
set(hl,'FontSize',14);

