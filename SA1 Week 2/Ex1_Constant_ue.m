Re = 2500;
n = 101;
x = (0:.01:1);
ue = ones(1,n);
thetasq = zeros(1,n);
theta = zeros(1,n);
for i = [2:n]
    thetasq(i) = thetasq(i-1) + (ueintbit(x(i-1),ue(i-1),x(i),ue(i)));
    thetaBlasius(i) = 0.664/(Re ^ 0.5) * x(i) ^ 0.5;
    theta(i) = thetasq(i) ^ 0.5;
end

plot(x, theta);
hold on
plot(x, thetaBlasius);
hold off
