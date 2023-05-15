clear
close all

nx = 51;
ny = 41;
nv = 100;

xmax = 2.5;
xmin = -2.5;
ymax = 2;
ymin = -2;

xa = 4.1;
xb = 2.2;
ya = 1.3;
yb = 2.9;
dir = [xa-xb, ya-yb];
del = norm(dir);

ga = 1;
gb = 0;
psi = zeros(nx, ny);
for k = [1:1:nv]
    Gamma(k) =  (ga + (k-0.5)*(gb-ga)/(nv))*del/(nv);
    xc(k) = xa + (k-0.5)*(xb-xa)/nv;
    yc(k) = ya + (k-0.5)*(yb-ya)/nv;
    for i = [1:1:nx]
        for j = [1:1:ny]
            xm(i,j) = xmin + (i-1)*(xmax-xmin)/(nx-1);
            ym(i,j) = ymin + (j-1)*(ymax-ymin)/(ny-1);
            [faval, fbval] = panelinf(xa, ya, xb, yb, xm(i,j), ym(i,j));
            infa(i,j) = faval;
            infb(i,j) = fbval;
            psi(i,j) = psi(i,j) + psipv(xc(k), yc(k),Gamma(k),xm(i,j),ym(i,j));
        end
    end
end
c = -0.15:0.05:0.15;
figure(1)
contour(xm,ym,psi,c)
figure(2)
contour(xm,ym,infa,c)
figure(3)
contour(xm,ym,infb,c)
