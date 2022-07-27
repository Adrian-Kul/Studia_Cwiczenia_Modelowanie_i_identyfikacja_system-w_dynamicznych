Ts=0.5;
td=0:Ts:10;
t=0:(Ts/100):10;
u_st=ones(size(td));
u_ln=td;

% sys=tf([1],[1 3]); 		%1 rzad
% sys=tf([1 1],[1 2 3]); 	%2 rzad
sys=tf([1 2],[1 2 1 1]);	%3 rzad
sysd_imp=c2d(sys,Ts,'foh');

[yr_st,tt_st] = step(sys,40);		%uk≥ad skok
[yr_imp,tt_imp] = impulse(sys,40);	%uk≥ad impuls
[yr_ln,tt_ln] = lsim(sys,u_ln,td);		%uk≥ad liniowy
[yy,tt]=step(sysd_imp);
[t_st_imp,y_st_imp]=stairs(tt,yy);
[yy,tt]=impulse(sysd_imp);
[t_imp_imp,y_imp_imp]=stairs(tt,yy);
[yy,tt]=lsim(sysd_imp,u_ln,td);
[t_ln_imp,y_ln_imp]=stairs(tt,yy);


figure
plot(tt_imp,yr_imp,t_imp_imp,y_imp_imp,'LineWidth',2);
title('Odpowiedü impulsowa zdyskretyzowanego uk≥adu metodπ liniowo-narastajπcπ');

figure
plot(tt_st,yr_st,t_st_imp,y_st_imp,'LineWidth',2);
title('Odpowiedü skokowa zdyskretyzowanego uk≥adu metodπ liniowo-narastajπcπ');

figure
plot(tt_ln,yr_ln,t_ln_imp,y_ln_imp,'LineWidth',2);
title('Odpowiedü na sygna≥ liniowo narastajπcy zdyskretyzowanego uk≥adu metodπ liniowo-narastajπcπ');
