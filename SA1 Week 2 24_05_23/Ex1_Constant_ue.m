Re = 2500;
n = 101;
x = (0:.01:1);
ue = ones(1,n);
integral = zeros(1,n);
for i = [2:n]
    integral(i) = integral(i-1) + (ueintbit(x(i-1),ue(i-1),x(i),ue(i))); 
end
thetaBlasius = 0.664/(Re ^ 0.5) * x .^ 0.5;
thetasq = (0.45/Re)*ue.^-6 .* integral;
theta = thetasq .^ 0.5;
plot(x, theta);
hold on
plot(x, thetaBlasius);
hold off
