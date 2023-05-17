function lhsmat = build_lhs(xs,ys)
np = length(xs);
Xs = zeros(np,np); % repmat(xs.',1,np);
Ys = zeros(np,np); % repmat(ys,np,1);

for i = 1:1:np
    for j = 1:1:np
        Xs(i,j) = xs(i);
        Ys(i,j) = ys(j);
    end
end

INFA = zeros(np,np);
INFB = zeros(np,np);
for k = 1:1:np-1
    [infa, infb] = panelinf(xs(k), ys(k), xs(k+1), ys(k+1), Xs, Ys);
    INFA = INFA + infa;
    INFB = INFB + infb;
end
psip = INFA + circshift(INFB, [0 1]);

lhsmat = circshift(psip, [0 1]) - psip;
lhsmat(1,:) = 0;
lhsmat(np,:) = 0;
lhsmat(1,1) = 1;
lhsmat(np, np) = 1;

