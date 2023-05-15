clear
close all

xc = 0.75;
yc = 0.5;
del = 1.5;

nx = 51;
ny = 41;

ga = 1;
gb = 0;
nv = 100;
step = (gb-ga)/(nv);
Gamma = linspace(ga+step/2, gb-step/2, nv-1) * del/nv;

[xm, ym] = buildSpace(-2.5,2.5,-2,2,51,41);

psi = zeros(nx, ny);
for s = 1:1:nv-1
    xpos = (s-0.5)*del/nv;
    psi = psi + psipv(xpos,0,Gamma(s),xm,ym);
end

c = -0.15:0.05:0.15;
figure(1)
title('Psi from ga, gb as vortices')
contour(xm,ym,psi,c)