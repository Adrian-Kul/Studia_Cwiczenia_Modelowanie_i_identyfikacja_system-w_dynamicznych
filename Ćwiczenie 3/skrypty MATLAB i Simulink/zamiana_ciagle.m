H = tf([1],[1 2 3]); 
% H = tf([1 2],[1 2 1 1]); 
z = tf('z',0.01);
H_d = (0.00006*z + 0.000007) / (z^2 - 1.98*z + 0.9802);

% Hd = c2d(H,0.01,'zoh')

[y,t]=step(H,30);
[yy,tt]=step(H_d,30);

figure
plot(t,y,tt,yy,'Linewidth',2)
hxl=xlabel('czas [s]');
set(hxl,'FontSize',14);
hl=legend('uk≥ad ciπg≥y','odpowiedü uk≥adu dyskretnego');
set(hl,'FontSize',14);