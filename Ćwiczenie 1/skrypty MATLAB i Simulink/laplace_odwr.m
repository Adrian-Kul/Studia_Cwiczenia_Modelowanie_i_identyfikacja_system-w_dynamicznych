% sys=tf(1,[1 1 1]);
syms s
F = 1/(s^3+s);
ilaplace(F)