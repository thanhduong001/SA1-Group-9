function lhsmat = build_lhs(xs,ys)
np = length(xs);
Xs = repmat(xs,np,1);
Ys = repmat(ys.',1,np);
g = -2*ys;

INFA = zeros(np,np);
INFB = zeros(np,np);
for k = 1:1:np-1
    [infa, infb] = panelinf(xs(k), ys(k), xs(k+1), ys(k+1), Xs, Ys);
    INFA = INFA + infa;
    INFB = INFB + infb;
end
psip = INFA + circshift(INFB, [0 1]);

lhsmat = circshift(psip, [0 1]) - psip;
% temp_lhsmat = [zeros(np+1, 1) lhsmat_no_bc zeros(np+1, 1)];
% lhsmat = [zeros(1, np+3); temp_lhsmat; zeros(1, np+3)];
lhsmat(:,1) = 0;
lhsmat(1,:) = 0;
lhsmat(:,np) = 0;
lhsmat(np,:) = 0;
lhsmat(1,1) = 1;
lhsmat(np, np) = 1;

