function lhsmat = build_lhs(xs,ys)
np = length(xs) - 1;
psip = zeros(np,np+1);

nx = 51;
ny = 41;
[xm, ym] = buildSpace(-2.5,2.5,-2,2,nx,ny);

g = -2*ys;
for k = 1:1:np
    [infa, infb] = panelinf(xs(k), ys(k), xs(k+1), ys(k+1), xm, ym);
end

for i = 1:1:np-1
    for j = 1:1:np+1
        if j == 1
            psip(i,j) = INFL(i,j, 1);
        elseif j == np+1
            psip(i,j) = INFL(i,j-1, 2);
        else
            psip(i,j) = INFL(i,j, 1) + INFL(i,j-1, 2);
            
        end
    end
end

lhsmat = zeros(np+1,np+1);
for i = [1:1:np-1]
    for j = [1:1:np+1]
        lhsmat(i,j)  = psip(i+1,j) - psip(i,j);
    end
end

lhsmat(np,1) = 1;
lhsmat(np+1, np+1) = 1;

