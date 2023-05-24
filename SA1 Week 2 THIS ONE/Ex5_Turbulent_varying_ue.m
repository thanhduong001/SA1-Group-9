clear all
clc

global Re ue0 duedx
Re = 10^6;
ue0 = 1;
duedx = 0;
x0 = 0.01;
thick0(1) = 0.037*x0*(Re*x0)^(-1/5);
thick0(2) = 1.80*thick0(1);
[delx, thickhist] = ode45(@thickdash,[0 0.99],thick0);

x = x0 + delx;
theta7 = 0.037 * x .* (Re * x) .^ (-1/5);
theta9 = 0.023 * x .* (Re * x) .^ (-1/6);
figure(1)
plot(x, thickhist(:,1))
hold on
plot(x, theta7)
plot(x, theta9)
hold off
figure(2)
plot(x, thickhist(:,2)./thickhist(:,1))