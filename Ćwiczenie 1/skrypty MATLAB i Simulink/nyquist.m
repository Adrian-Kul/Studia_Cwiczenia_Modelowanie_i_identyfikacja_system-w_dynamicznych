T=1;

sys=tf(1,[1 1 1]);
nyquist(sys)

% sysd_wprzod = tf([T^2],[1 (T-2) (1-T+T^2)]);
% sysd_wst = tf([T^2 0 0] , [(1+T+T^2) (-T-2) 1]);
% sysd_tustin = tf([T^2 2*T^2 T^2] , [(4+2*T+T^2) (2*T^2-8) (4-2*T+T^2)]);
