clear
close all

xc = 0.75;
yc = 0.5;
Gamma = 3;
del = 1.5;

[xm, ym] = buildSpace(-2.5,2.5,-2,2,51,41);
psi = psipv(xc,yc,Gamma,xm,ym);
[infa, infb] = refpaninf(del,xm,ym);

c = -0.15:0.05:0.15;
figure(1)
title('Influence of left vortex')
contour(xm,ym,infa,c)

figure(2)
title('Influence of right vortex')
contour(xm,ym,infb,c)