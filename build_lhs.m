function lhsmat = build_lhs(xs,ys)
np = length(xs) - 1;
psip = zeros(np,np+1);

nx = 51;
ny = 41;

xmax = 2.5;
xmin = -2.5;
ymax = 2;
ymin = -2;

for i = 1:1:np-1
    for j = 1:1:np
        [infa, infb] = panelinf(xs(j), ys(j), xs(j+1), ys(j+1), xs(i), ys(i))
        INFL(i,j, 1) = infa
        INFL(i,j, 2) = infb
    end
end
for i = 1:1:np-1
    for j = 1:1:np
        if j == 1
            psi(i,j) = INFL(i,j, 1)
        elseif j == np+1
            psi(i,j) = INFL(i,j, 1) + INFL(i,j-1, 2)
        else
            psi(i,j) = INFL(i,j-1, 2)
        end
    end
end

lhsmat = zeros(np+1,np+1); 
lhsmat(1,1) = 1
lhsmat(np+1,np+1) = 1
