clear
close all
clc

nx = 51;
ny = 41;
[xm, ym] = buildSpace(-2.5,2.5,-2,2,nx,ny);

np = 100;
theta = linspace(0, 2*pi, np);
theta(np+1) = theta(1);

xs = cos(theta);
ys = sin(theta);
g = -2*ys;

%freestream
psi = ym;

for k = 1:1:np
    [infa, infb] = panelinf(xs(k), ys(k), xs(k+1), ys(k+1), xm, ym);
    psi = psi + g(k)*infa + g(k+1)*infb;
end

c = -1.75:0.25:1.75;
contour(xm,ym,psi,c)
hold on
plot(xs,ys)
hold off




