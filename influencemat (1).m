clear
close all

nx = 51;
ny = 41;
xmax = 2.5;
xmin = -2.5;
ymax = 2;
ymin = -2;
del = 1.5;
ga = 0
gb = 1

for i = [1:1:nx]
    for j = [1:1:ny]
        xm(i,j) = xmin + (i-1)*(xmax-xmin)/(nx-1);
        ym(i,j) = ymin + (j-1)*(ymax-ymin)/(ny-1);
        [infa(i,j), infb(i,j)] = refpaninf(del,xm(i,j),ym(i,j));
        psi(i,j) = ga * infa(i,j) + gb * infb(i,j);
    end
end

c = -0.15:0.05:0.15
figure(1)
contour(xm,ym,infa,c)
figure(2)
contour(xm,ym,infb,c)