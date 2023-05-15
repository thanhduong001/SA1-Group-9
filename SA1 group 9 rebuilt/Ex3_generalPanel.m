clear
close all
clc

nx = 51;
ny = 41;
[xm, ym] = buildSpace(0,5,0,4,nx,ny);

xa = 4.1;
xb = 2.2;
ya = 1.3;
yb = 2.9;

dir = [xa-xb, ya-yb];
del = norm(dir);

ga = 1;
gb = 1;
nv = 100;

g_step = (gb-ga)/nv;
x_step = (xb-xa)/nv;
y_step = (yb-ya)/nv;

Gamma = linspace(ga+g_step/2, gb-g_step/2, nv-1) * del/nv;
xc = linspace(xa+x_step/2, xb-x_step/2, nv-1);
yc = linspace(ya+y_step/2, yb-y_step/2, nv-1);

[infa, infb] = panelinf(xa, ya, xb, yb, xm, ym);
psi_inf = infa * ga + infb * gb;

psi = zeros(nx, ny);
for k = [1:1:nv-1]
    psi = psi + psipv(xc(k), yc(k),Gamma(k),xm,ym);
end

c = -0.15:0.05:0.15;
figure(1)
title('Streamfunction')
contour(xm,ym,psi,c)
figure(2)
title('Influence a')
contour(xm,ym,infa,c)
figure(3)
title('Influence b')
contour(xm,ym,infb,c)
figure(4)
title('Streamfunction by influences')
contour(xm,ym,psi_inf,c)
