function lhsmat = build_lhs(xs,ys)
np = length(xs) - 1;
psip = zeros(np,np+1);
for i = 1:1:np%
 for j = 1:1:np
 [infa, infb] = panelinf(xs(j), ys(j), xs(j+1), ys(j+1), xs(i), ys(i));
 INFL(i,j, 1) = infa;
 INFL(i,j, 2) = infb;
 end
end
for i = 1:1:np
 psip(i,1) = INFL(i,1, 1);
 psip(i,np+1) = INFL(i,np,2);
end

for i = 1:1:np
 for j = 2:1:np
 psip(i,j) = INFL(i,j, 1) + INFL(i,j-1, 2);
 end
end
lhsmat = zeros(np+1,np+1);
for i = [2:np]
 for j = [1:np+1]
 lhsmat(i,j) = psip(i,j) - psip(i-1,j);
 end
end

lhsmat(1,1) = 1;
lhsmat(1,np+1) = -1;
lhsmat(np+1, 1) = -1;
lhsmat(np+1, 2) = 1;
lhsmat(np+1,3) = -0.5;
lhsmat(np+1, np) = -1;
lhsmat(np+1, np - 1) = 0.5;
