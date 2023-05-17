function rhsvec = build_rhs(xs, ys, alpha)
np = length(xs) - 1;
psifs = ys*cos(alpha) - xs*sin(alpha);
for i = [1:1:np-1]
    rhsvec(i,1) = psifs(i) - psifs(i+1);
end
rhsvec(np) = 0;
rhsvec(np+1) = 0;
