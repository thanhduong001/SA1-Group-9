% function lhsmat = build_lhs(xs,ys)
% np = length(xs) - 1;
% psip = zeros(np,np+1);
% 
% nx = 51;
% ny = 41;
% 
% xmax = 2.5;
% xmin = -2.5;
% ymax = 2;
% ymin = -2;
% 
% for i = 1:1:nx
%     for j = 1:1:ny
%         xm(i,j) = xmin + (i-1)*(xmax-xmin)/(nx-1);
%         ym(i,j) = ymin + (j-1)*(ymax-ymin)/(ny-1);
%         psifs(i,j) = ym(i,j);
%     end
% end
% 
% for i = 1:1:np
%     for j = 1:1:np
%         [infa, infb] = panelinf(xs(j), ys(j), xs(j+1), ys(j+1), xs(i), ys(i));
%         INFL(i,j, 1) = infa;
%         INFL(i,j, 2) = infb;
%     end
% end
% size(INFL(:,:,1))
% figure(5)
% for i = [1:1:np]
%     k(i) = i;
% end
% 
% %plot(k, INFL(1,k,1))
% 
% for i = 1:1:np
%     for j = 1:1:np+1
%         if j == 1
%             psip(i,j) = INFL(i,j, 1);
%         elseif j == np+1
%             psip(i,j) = INFL(i,j-1, 2);
%         else
%             psip(i,j) = INFL(i,j, 1) + INFL(i,j-1, 2);
% 
%         end
%     end
% end
% 
% lhsmat = zeros(np+1,np+1);
% for i = [2:1:np]
%     for j = [1:1:np+1]
%         lhsmat(i,j)  = psip(i,j) - psip(i-1,j);
%     end
% end
% 
% lhsmat(1,1) = 1;
% lhsmat(np+1, np+1) = 1;

function lhsmat = build_lhs(xs,ys)
np = length(xs) - 1;
psip = zeros(np,np+1);

nx = 51;
ny = 41;

xmax = 2.5;
xmin = -2.5;
ymax = 2;
ymin = -2;

for i = 1:1:nx
    for j = 1:1:ny
        xm(i,j) = xmin + (i-1)*(xmax-xmin)/(nx-1);
        ym(i,j) = ymin + (j-1)*(ymax-ymin)/(ny-1);
        psifs(i,j) = ym(i,j);
    end
end

for i = 1:1:np%
    for j = 1:1:np
        [infa, infb] = panelinf(xs(j), ys(j), xs(j+1), ys(j+1), xs(i), ys(i));
        INFL(i,j, 1) = infa;
        INFL(i,j, 2) = infb;
    end
end

for i = 1:1:np
    psip(i,1) = INFL(i,1, 1);
    psip(i,np+1) = INFL(i,np,2);
end
    

for i = 1:1:np
    for j = 2:1:np
        psip(i,j) = INFL(i,j, 1) + INFL(i,j-1, 2);
    end
end

lhsmat = zeros(np+1,np+1);
for i = [2:1:np]
    for j = [1:1:np+1]
        lhsmat(i,j)  = psip(i,j) - psip(i-1,j);
    end
end

lhsmat(1,1) = 1;
lhsmat(np+1, np+1) = 1;


