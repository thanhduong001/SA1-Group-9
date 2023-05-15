clear
close all

xc = 0.75;
yc = 0.5;
Gamma = 3;
del = 1.5;

[xm, ym] = buildSpace();
psi = psipv(xc,yc,Gamma,xm,ym);
[infa, infb] = refpaninf(del,xm,ym);

c = -0.15:0.05:0.15;
figure('Influence of left vortex')
contour(xm,ym,infa,c)
figure('Infleunce of right vortex')
contour(xm,ym,infb,c)