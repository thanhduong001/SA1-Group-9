clear
close all

nx = 51;
ny = 41;
nv = 100;
xmax = 2.5;
xmin = -2.5;
ymax = 2;
ymin = -2;
del = 1.5;
ga = 0;
gb = 1;
psi = zeros(nx, ny);
for k = [1:1:nv]
    Gamma(k) =  (ga + (k-0.5)*(gb-ga)/(nv))*del/(nv);
    for i = [1:1:nx]
        for j = [1:1:ny]
            xm(i,j) = xmin + (i-1)*(xmax-xmin)/(nx-1);
            ym(i,j) = ymin + (j-1)*(ymax-ymin)/(ny-1);
            psi(i,j) = psi(i,j) + psipv((k-0.5)*del/nv,0,Gamma(k),xm(i,j),ym(i,j));
        end
    end
end
c = -0.15:0.05:0.15;
contour(xm,ym,psi,c)
          