function [xm, ym] = buildSpace(xmax, xmin, ymax, ymin, nx, ny)
    for i = 1:1:nx
        for j = 1:1:ny
            xm(i,j) = xmin + (i-1)*(xmax-xmin)/(nx-1);
            ym(i,j) = ymin + (j-1)*(ymax-ymin)/(ny-1);
        end
    end
end