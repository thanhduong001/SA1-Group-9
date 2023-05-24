Re = 100000;
n = 101;
duedx = ones(1,n) * -1;
ue0 = ones(1,n) * 1;
x = (0:.01:1);
ue = zeros(1,n);
ue = ue0 + duedx .* x;
integral = zeros(1,n);
thetasq = zeros(1,n);
theta = zeros(1,n);
laminar = true;
integral = zeros(1,n);
i = 1;
for i = [2:n]
    integral(i) = integral(i-1) + (ueintbit(x(i-1),ue(i-1),x(i),ue(i))); 
end
i = 1;
while laminar && i < n
    i = i + 1;
    thetasq(i) = (0.45/Re)*ue(i)^-6 * integral(i);
    theta(i) = thetasq(i) ^ 0.5;
    m = -Re * (thetasq(i) * duedx(i));
    H = thwaites_lookup(m);
    He(i) = laminar_He(H);
    Rethet = Re * ue(i) * theta(i);
    if log(Rethet) >= 18.4*He - 21.74
        laminar = false;
        disp([x(i) Rethet/1000])
    end
end



plot(x, theta);
