function e=funkcja_celu_ciagly(z,y,u)
% Phi=[u(2:(end-1)) u(1:(end-2)) -y(2:(end-1)) -y(1:(end-2)) ];
u2 = u(2:(end-1));
u1 = u(1:(end-2));
y2 = y(2:(end-1));
y1 = y(1:(end-2));
Phi=[u2 u1 -y2 -y1];
Y = y(3:end);

ym = Phi*z';
e=(Y-ym)'*(Y-ym);
