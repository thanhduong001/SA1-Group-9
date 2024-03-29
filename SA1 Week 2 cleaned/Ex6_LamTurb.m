clear
close all
clc

global Re ue0 duedx
Re = 10^6;
ue0 = 1;
duedx = -0.25;
n = 101;

duedxarray = ones(1,n) * duedx;
ue0array = ones(1,n) * ue0;
x = 0:.01:1;
ue = ue0array + duedxarray .* x;

integral = zeros(1,n);
for i = 2:n
    integral(i) = integral(i-1) + (ueintbit(x(i-1),ue(i-1),x(i),ue(i))); 
end

thetasq = zeros(1,n);
theta = zeros(1,n);
laminar = true;
int = 0;
ils = 0;
itr = 0;
its = 0;
He = zeros(1,n);
He(1) = 1.5728;
i = 1;
while laminar && i < n
    i = i + 1;
    thetasq(i) = (0.45/Re)*ue(i)^-6 * integral(i);
    theta(i) = thetasq(i) ^ 0.5;
    m = -Re * (thetasq(i) * duedxarray(i));
    H = thwaites_lookup(m);
    He(i) = laminar_He(H);
    Rethet = Re * ue(i) * theta(i);
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
    ue0 = ue(i-1);
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
    deltae = He(i) * theta(i);
    if He(i) >= 1.46
        H = (11 * He(i) + 15)/(48 * He(i) - 59);
    else
        H = 2.803;
    end
    theta(i) = theta(i-1) * (ue(i)/ue(i-1)) ^ (H + 2);
end

if int ~= 0
disp(['Natural transition at ' num2str(x(int)) ...
 ' with Rethet ' num2str(Rethet)])
end

if ils ~= 0
disp(['Laminar separation at ' num2str(x(ils)) ...
 ' with Rethet ' num2str(Rethet)])
end

if itr ~= 0
disp(['Turbulent reattachment at ' num2str(x(itr)) ...
 ' with Rethet ' num2str(Rethet)])
end

if its ~= 0
disp(['Turbulent separation at ' num2str(x(its)) ...
 ' with Rethet ' num2str(Rethet)])
end



figure(1)
plot(x, He)
figure(2)
plot(x, theta);