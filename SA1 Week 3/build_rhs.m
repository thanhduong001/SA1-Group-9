function rhsvec = build_rhs(xs, ys, alpha)
np = length(xs) - 1;
psifs = (ys*cos(alpha) - xs*sin(alpha));
rhsvec = zeros(np+1, 1)
for i = [2:1:np]
    rhsvec(i,1) = psifs(i-1) - psifs(i);
end
rhsvec(1) = 0;
rhsvec(np+1) = 0;


