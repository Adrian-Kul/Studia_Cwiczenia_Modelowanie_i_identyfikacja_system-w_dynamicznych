H = tf([1],[1 3 2]); 
z = tf('z',0.001);
% H_d = (0.00407366*z + 0.00488065) / (z^2 - 1.648058*z + 0.664069);
H_d = (2.411617e-06*z -7.808237e-06) / (z^2 -0.493001*z -0.497887);

Hd = c2d(H,0.001,'zoh')

[y,t]=step(H,30);
[yy,tt]=step(H_d,30);

figure
plot(t,y,tt,yy,'Linewidth',2)
hxl=xlabel('czas [s]');
set(hxl,'FontSize',14);
hl=legend('uk≥ad ciπg≥y','odpowiedü uk≥adu dyskretnego');
set(hl,'FontSize',14);