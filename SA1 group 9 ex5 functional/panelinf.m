function [infa, infb] = panelinf(xa, ya, xb, yb, x, y)
    r = [x-xa, y-ya];
    T = [xb-xa, yb-ya];
    t = T/norm(T);
    N = [-(yb-ya), xb-xa];
    n = N/norm(N);

    del = norm(T);
    X = dot(r, t);
    Y = dot(r, n);
    [infa, infb] = refpaninf(del,X,Y);
end