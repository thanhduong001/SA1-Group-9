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

alpha = 0;
A = build_lhs(xs,ys, np);
b = build_rhs(xs,ys,alpha);
gam = A\b.';

for k = [1:1:np]
    xc(k) = (xs(k) + xs(k+1))/2;
    yc(k) = (ys(k) + ys(k+1))/2;
    Gamma(k) = ((gam(k) + gam(k+1))/2)*(2 * pi * 1/np);
end

psipanel = zeros(nx, ny);
for k = 1:1:np
    psipanel = psipanel + psipv(xc(k), yc(k),Gamma(k),xm,ym);
end

figure(2)
c = -1.75:0.25:1.75;
axis([0 2 -2.5 2.5]);
contour(xm,ym,psipanel,c)

figure(3)
for i = [1:1:np]
    k(i) = i;
end
plot(k, Gamma)
