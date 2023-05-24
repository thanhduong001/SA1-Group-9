clear
close all
clc

Re = 100000;
n = 101;
duedx = ones(1,n) * -1;
ue0 = ones(1,n) * 1;
x = (0:.01:1);
ue = ue0 + duedx .* x;

integral = zeros(1,n);
for i = 2:n
    integral(i) = integral(i-1) + (ueintbit(x(i-1),ue(i-1),x(i),ue(i))); 
end

thetasq = (0.45/Re) * (ue.^-6) .* integral;
theta = thetasq .^ 0.5;
m = -Re * (thetasq .* duedx);
H = thwaites_lookup(m)
He = laminar_He(H);

i = 1;
laminar = true;
while laminar && i < n
    i = i + 1;
    Rethet = Re * ue(i) * theta(i);
    if log(Rethet) >= 18.4*He - 21.74
        laminar = false;
        disp([x(i) Rethet/1000]);
    end
end
plot(x(1:i), theta(1:i));


