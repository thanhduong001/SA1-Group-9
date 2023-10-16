Re = 2500;
U = 5;
x = (0:.01:1);
ue = ones(101) * U;
theta = zeros(101);
thetaTot = zeros(101);
for i = [2:101]
    (ueintbit(x(i-1),ue(i-1),x(i),ue(i))) ^ 0.5
    theta(i) = theta(i-1) + (ueintbit(x(i-1),ue(i-1),x(i),ue(i)));
    thetaBlasius(i) = 0.664/(Re ^ 0.5) * x(i) ^ 0.5;
end
theta = theta .^ 0.5;
plot(x, theta);
hold on
plot(x, thetaBlasius);
hold off
