clear all
global ue0

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
int = 0;
ils = 0;
itr = 0;
its = 0;
i = 1;
He = zeros(1,n);
He(1) = 1.5728;
while laminar && i < n
    i = i + 1;
    thetasq(i) = (ueintbit(x(i-1),ue(i-1),x(i),ue(i)));
    thetasq(i) = thetasq(i-1) + (ueintbit(x(i-1),ue(i-1),x(i),ue(i)));
    theta(i) = thetasq(i) ^ 0.5;
    m = -Re * (thetasq(i) * duedx(i));
    H = thwaites_lookup(m);
    He(i) = laminar_He(H);
    Rethet = Re * ue(i) * theta(i);
    if m >= 0.9
        ils = i;
        He(i) = 1.51509;
        laminar = false;
        disp([x(i) Rethet/1000])
    end
    if log(Rethet) >= 18.4*He(i) - 21.74
        int = i;
        laminar = false;
        disp([x(i) Rethet/1000])
    end
end
deltae = He(i) * theta(i);
ue0 = ue(i);
thick0(1) = theta(i);
thick0(2) = theta(i) * 1.8;
while its == 0 && i < n
    i
    size(He)
    size(theta)
    [delx thickhist] = ode45(@thickdash,[0, x(i)-x(i-1)],thick0);
    thickhist
    i = i + 1;
end

if int ~= 0
disp(['Natural transition at ' num2str(x(int)) ...
 ' with Rethet ' num2str(Rethet)])
end

if ils ~= 0
disp(['Laminar separation at ' num2str(x(ils)) ...
 ' with Rethet ' num2str(Rethet)])
end



plot(x, theta);