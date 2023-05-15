clear
close all

xc = 0.75;
yc = 0.5;
Gamma = 3;
nv = 1;

[xm, ym] = buildSpace();
psi = psipv(xc,yc,Gamma,xm,ym)

Figure('Line vortex contours')
c = -0.4:0.2:1.2
contour(xm,ym,psi,c)