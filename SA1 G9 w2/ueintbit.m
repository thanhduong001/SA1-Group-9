function [f] = ueintbit(xa,ua,xb,ub)
Re = 2500;
uBar = (ua + ub)/2;
uDelta = ub - ua;
xDelta = xb - xa;
intContribution = (uBar ^ 5 + 5/6 * uBar ^ 3 * uDelta ^ 2 + 1/16 * uBar * uDelta ^ 4) * xDelta;
f = 0.45/Re * uBar ^ -6 * intContribution;
