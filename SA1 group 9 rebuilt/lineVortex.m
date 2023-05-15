clear
close all

xc = 0.75;
yc = 0.5;
Gamma = (3);
nv = 1;

[psi, xm, ym] = buildSpace(Gamma, nv, xc, yc);

c = -0.4:0.2:1.2
contour(xm,ym,psi,c)
