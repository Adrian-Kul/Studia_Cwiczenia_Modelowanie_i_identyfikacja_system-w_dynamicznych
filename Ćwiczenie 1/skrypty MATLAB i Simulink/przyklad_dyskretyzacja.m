Ts=1;
td=0:Ts:10;

u_st=ones(size(td));
u_ln=td;

yr_st=1-exp(-td);
yr_imp=exp(-td);
yr_ln=td-1+exp(-td);

sys=tf([1],[1 1]);
sysd_imp=c2d(sys,Ts,'impulse');
[yy,tt]=step(sysd_imp);
[t_st_imp,y_st_imp]=stairs(tt,yy);

[yy,tt]=impulse(sysd_imp);
[t_imp_imp,y_imp_imp]=stairs(tt,yy);

[yy,tt]=lsim(sysd_imp,u_ln,td);
[t_ln_imp,y_ln_imp]=stairs(tt,yy);



figure
plot(td,yr_imp,t_imp_imp,y_imp_imp,'LineWidth',2);
title('Odpowied� impulsowa zdyskretyzowanego uk�adu metod� impulsow�');

figure
plot(td,yr_st,t_st_imp,y_st_imp,'LineWidth',2);
title('Odpowied� skokowa zdyskretyzowanego uk�adu metod� impulsow�');

figure
plot(td,yr_ln,t_ln_imp,y_ln_imp,'LineWidth',2);
title('Odpowied� na sygna� liniowo narastaj�cy zdyskretyzowanego uk�adu metod� impulsow�');

