Re = 100000;
n = 101;
duedx = ones(1,n) * 0;
ue0 = ones(1,n) * 1;
x = (0:.01:1);
ue = zeros(1,n);
ue = ue0 + duedx .* x;
thetasq = zeros(1,n);
theta = zeros(1,n);
laminar = true;
i = 1;
while laminar && i < n
    i = i + 1;
    thetasq(i) = (ueintbit(x(i-1),ue(i-1),x(i),ue(i)));
    thetasq(i) = thetasq(i-1) + (ueintbit(x(i-1),ue(i-1),x(i),ue(i)));
    theta(i) = thetasq(i) ^ 0.5;
    m = -Re * (thetasq(i) * duedx(i));
    H = thwaites_lookup(m);
    He = laminar_He(H);
    Rethet = Re * ue(i) * theta(i);
    if log(Rethet) >= 18.4*He - 21.74
        laminar = false;
        disp([x(i) Rethet/1000])
    end
end



plot(x, theta);
