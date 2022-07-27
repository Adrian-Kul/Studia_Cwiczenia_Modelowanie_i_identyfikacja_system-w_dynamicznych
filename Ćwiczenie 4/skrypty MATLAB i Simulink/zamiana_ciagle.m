H = tf([1 1],[1 0.5 3]); 
z = tf('z',0.1);
H_d = (0.10196*z - 0.0922299) / (z^2 - 1.92204*z + 0.95123);

Hd = c2d(H,0.1,'zoh')

[y,t]=step(H,30);
[yy,tt]=step(H_d,30);

figure
plot(t,y,tt,yy,'Linewidth',2)
hxl=xlabel('czas [s]');
set(hxl,'FontSize',14);
hl=legend('uk≥ad ciπg≥y','odpowiedü uk≥adu dyskretnego');
set(hl,'FontSize',14);