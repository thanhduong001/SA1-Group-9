function [int ils itr its delstar theta] = bl_solv(x,cp)
global Re ue0 duedx
n = length(x);
% duedx = -0.25;
% duedxarray = ones(1,n) * duedx;
ue0 = 0;
x = (0:.01:1);
% ue = zeros(1,n);
% ue = ue0array + duedxarray .* x;
thetasq = zeros(1,n);
theta = zeros(1,n);
laminar = true;
int = 0;
ils = 0;
itr = 0;
its = 0;
i = 1;
He = zeros(1,n);
He(1) = 1.5728;
integral = zeros(1,n);
ue0 = (1 - cp(1)) ^ 0.5;
ueprev = 0;
duedx = (ue0 - ueprev)/(x(1));
integral(1) = (ueintbit(0,0,x(1),ue0));
thetasq(1) = (0.45/Re)*ue0^-6 * integral(1);
theta(1) = thetasq(1) ^ 0.5;

while laminar && i < n
    i = i + 1;
    ue0 = (1 - cp(i)) ^ 0.5;
    ueprev = (1 - cp(i-1)) ^ 0.5;
    integral(i) = integral(i-1) + (ueintbit(x(i-1),ueprev,x(i),ue0));
    duedx = (ue0 - ueprev)/(x(i) - x(i-1));
    thetasq(i) = (0.45/Re)*ue0^-6 * integral(i);
    theta(i) = thetasq(i) ^ 0.5;
    m = -Re * (thetasq(i) * duedx);
    H = thwaites_lookup(m);
    delstar(i) = H * theta(i);
    He(i) = laminar_He(H);
    Rethet = Re * ue0 * theta(i);
    if m >= 0.09
        ils = i;
        He(i) = 1.51509;
        laminar = false;
        disp([x(i) Rethet/1000])
    end
    if log(Rethet) >= 18.4*He(i) - 21.74
        int = i;
        laminar = false;
        disp([x(i) Rethet/1000]);
    end
end
deltae = He(i) * theta(i);
while its == 0 && i < n
    i = i + 1;
    ue0 = (1 - cp(i)) ^ 0.5;
    ueprev = (1 - cp(i-1)) ^ 0.5;
    integral(i) = integral(i-1) + (ueintbit(x(i-1),ueprev,x(i),ue0));
    duedx = (ue0 - ueprev)/(x(i) - x(i-1));
    m = -Re * thetasq(i) * duedx;
    thetasq(i) = (0.45/Re)*ue0^-6 * integral(i);
    theta(i) = thetasq(i);
    H = thwaites_lookup(m);
    delstar(i) = H * theta(i);
    thick0(1) = theta(i-1);
    thick0(2) = deltae;
    [delx, thickhist] = ode45(@thickdash,[0, x(i)-x(i-1)],thick0);
    theta(i) = thickhist(41,1);
    deltae = thickhist(41,2);
    He(i) = deltae/theta(i);
    if ils ~= 0 && itr == 0
        if He(i) >= 1.58
            itr = i;
        end
    elseif He(i) <= 1.46
        its = i;
    end       
end
while i < n
    i = i + 1;
    He(i) = He(i-1);
    ue0 = (1 - cp(i)) ^ 0.5;
    ueprev = (1 - cp(i-1)) ^ 0.5;
    duedx = (ue0 - ueprev)/(x(i) - x(i-1));
    m = -Re * thetasq(i) * duedx;
    integral(i) = integral(i-1) + (ueintbit(x(i-1),ueprev,x(i),ue0));
    thetasq(i) = (0.45/Re)*ue0^-6 * integral(i);
    theta(i) = thetasq(i);
    H = thwaites_lookup(m);
    delstar(i) = H * theta(i);
    deltae = He(i) * theta(i);
    if He(i) >= 1.46
        H = (11 * He(i) + 15)/(48 * He(i) - 59);
    else
        H = 2.803;
    end
    theta(i) = theta(i-1) * (ue0/ueprev) ^ (H + 2);
end


