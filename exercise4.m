nx = 51;
ny = 41;

xmax = 2.5;
xmin = -2.5;
ymax = 2;
ymin = -2;

np = 100;
theta = (0:np)*2*pi/np;
theta(101) = theta(1);
for k = 1:1:np+1
    xs(k) = cos(theta(k));
    ys(k) = sin(theta(k));
    g(k) = -2*sin(theta(k));
end

for i = 1:1:nx
    for j = 1:1:ny
        xm(i,j) = xmin + (i-1)*(xmax-xmin)/(nx-1);
        ym(i,j) = ymin + (j-1)*(ymax-ymin)/(ny-1);
        psi(i,j) = ym(i,j);
        for k = 1:1:np
            [infa, infb] = panelinf(xs(k), ys(k), xs(k+1), ys(k+1), xm(i,j), ym(i,j));
            psi(i,j) = psi(i,j) + g(k)*infa + g(k+1)*infb;
        end
    end
end
c = -1.75:0.25:1.75;
contour(xm,ym,psi,c)
hold on
plot(xs,ys)
hold off




