function [psi, xm, ym] = buildSpace(Gamma, nv, xc, yc)

nx = 51;
ny = 41;

xmax = 2.5;
xmin = -2.5;
ymax = 2;
ymin = -2;

for s = 1:1:nv
    for i = 1:1:nx
        for j = 1:1:ny
            xm(i,j) = xmin + (i-1)*(xmax-xmin)/(nx-1);
            ym(i,j) = ymin + (j-1)*(ymax-ymin)/(ny-1);
            psi(i,j) = psipv(xc,yc,Gamma(s),xm(i,j),ym(i,j));
        end
    end
end

end