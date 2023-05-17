function [infa, infb] = panelinf(xa, ya, xb, yb, xm, ym)
    T = [xb-xa, yb-ya];
    t = T/norm(T);
    N = [-(yb-ya), xb-xa];
    n = N/norm(N);
    del = norm(T);

    rm = cat(3,xm, ym);

    dim1 = size(xm, 1);
    dim2 = size(xm, 2);
    Xm = zeros(dim1, dim2);
    for i = 1:1:dim1
        for j = 1:1:dim2
            rij = [xm(i, j)-xa ym(i, j)-ya];
            Xm(i,j) = dot(rij, t);
            Ym(i,j) = dot(rij, n);
        end
    end

    [infa, infb] = refpaninf(del,Xm,Ym);
end