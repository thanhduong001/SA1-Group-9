clear
close all
clc

nx = 51;
ny = 41;
[xm, ym] = buildSpace(-2.5,2.5,-2,2,nx,ny);

np = 100;
theta = (0:np)*2*pi/np;
theta(101) = theta(1);

xs = cos(theta);
ys = sin(theta);

alpha = 0;
A = build_lhs(xs,ys);
b = build_rhs(xs,ys,alpha);
gam = A\b;

psi = ym;
for k = 1:1:np
    [infa, infb] = panelinf(xs(k), ys(k), xs(k+1), ys(k+1), xm, ym);
    psi = psi + gam(k)*infa + gam(k+1)*infb;
end

figure(1)
c = -1.75:0.25:1.75;
axis([0 2 -2.5 2.5]);
contour(xm,ym,psi,c)
