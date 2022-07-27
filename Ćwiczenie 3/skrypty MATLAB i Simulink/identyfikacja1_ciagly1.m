Phi=[u(1:(end-1)) -y(1:(end-1)) ];
Y=y(2:end);
theta=pinv(Phi)*Y;
D=svd(Phi);

Phi2=[0 0 
    u(1:(end-1)) -y(1:(end-1)) ];
Y2=y(1:end);
theta2=pinv(Phi2)*Y2;
D2=svd(Phi2);
