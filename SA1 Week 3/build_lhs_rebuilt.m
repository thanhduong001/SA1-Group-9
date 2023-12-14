function lhsmat = build_lhs(xs,ys)
np = length(xs); %this is actually np+1

INFA = zeros(np,np);
INFB = zeros(np,np);
for k = 1:1:np-2
    [infa, infb] = panelinf(xs(k), ys(k), xs(k+1), ys(k+1), xs, ys);
    INFA(:, k) = infa.';
    INFB(:, k) = infb.';
end
INFB = circshift(INFB, [0 1]);
psip = INFA + INFB;
psip(np, :) = zeros(1, np);

lhsmat = circshift(psip, [0 1]) - psip;
lhsmat(1,:) = 0;
lhsmat(1,1) = 1;
lhsmat(1,np) = -1;
lhsmat(np,:) = 0;
%lhsmat(np, np) = 1;
lhsmat(np, 1) = -1;
lhsmat(np, 2) = 1;
lhsmat(np,3) = -0.5;
lhsmat(np, np - 1) = -1;
lhsmat(np, np - 2) = 0.5;

% %%%%%%


% lhsmat = zeros(np,np);
% for i = [2:1:np-1]
%     for j = [1:1:np]
%         lhsmat(i,j)  = psip(i,j) - psip(i-1,j);
%     end
% end
% 
% lhsmat(1,1) = 1;
% lhsmat(np, np) = 1;

