function e=funkcja_celu1(z,y)
t=0:20;
ym=1-exp(-z(1)*t);
e=(y-ym)*(y-ym)';
