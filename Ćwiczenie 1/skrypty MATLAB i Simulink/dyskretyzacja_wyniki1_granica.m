time = 10;

sys=tf(1,[1 0 1]);
[yr,tt] = step(sys,time);

[t_s,y_s]=stairs(t,y_wp);
[t_ss,y_ss]=stairs(t,y_wt);
[t_sss,y_sss]=stairs(t,y_tus);

plot(t_s,y_s,t_s,y_ss,t_s,y_sss,tt,yr,'Linewidth',2)
hxl=xlabel('czas [s]');
set(hxl,'FontSize',14);
hl=legend('ró¿nica wprzód','ró¿nica wstecz','Tustin','odpowiedŸ uk³adu ci¹g³ego');
set(hl,'FontSize',14);