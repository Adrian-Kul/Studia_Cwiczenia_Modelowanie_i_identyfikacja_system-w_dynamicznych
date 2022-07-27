
tt=0:0.01:10;

y_cont = 1 - exp(-tt./2).*(cos((3^(1/2).*tt)/2) + (3^(1/2).*sin((3^(1/2).*tt)/2))/3);

figure
plot(t,y_wp,t,y_wt,t,y_tus,tt,y_cont,'Linewidth',2)
hxl=xlabel('czas [s]');
set(hxl,'FontSize',14);
hl=legend('r�nica wprz�d','r�nica wstecz','Tustin','odpowied� uk�adu ci�g�ego');
set(hl,'FontSize',14);