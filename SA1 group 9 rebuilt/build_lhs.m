function lhsmat = build_lhs(xs,ys)
np = length(xs) - 1;

nx = 51;
ny = 41;
[xm, ym] = buildSpace(-2.5,2.5,-2,2,nx,ny);

g = -2*ys;
for k = 1:1:np
    [infa, infb] = panelinf(xs(k), ys(k), xs(k+1), ys(k+1), xm, ym);
end

psip = zeros(np,np+1);

size(zeros(1, ny));
size(infa);

temp1_a = [infa zeros(nx, 1)];
temp2_a = [temp1_a; zeros(1, ny+1)];
temp1_b = [zeros(nx, 1) infb];
temp2_b = [zeros(1, ny+1) ; temp1_b];

psip = temp2_a + temp2_b;
%{
for i = 1:1:np-1
    for j = 1:1:np
        if j == 1 
            [psip(i,j), infb] = panelinf(xs(j), ys(j), xs(j+1), ys(j+1), xs(i), ys(i));
            psip(i,np+1) = psip(i,j);
        else
            [x1, y1] = panelinf(xs(j), ys(j), xs(j+1), ys(j+1), xs(i), ys(i));
            [x2, y2] = panelinf(xs(j-1), ys(j-1), xs(j), ys(j), xs(i), ys(i));
            psip(i,j) = x1 + y2;
        end
    end
end
%}
%{
lhsmat = zeros(np+1,np+1);
for i = [1:1:np-1]
    for j = [1:1:np+1]
        lhsmat(i,j)  = psip(i+1,j) - psip(i,j);
    end
end
%}
lhsmat_no_bc = circshift(psip, [0 1]) - psip;
size(lhsmat_no_bc)
temp_lhsmat = [zeros(nx+1, 1) lhsmat_no_bc zeros(nx+1, 1)];
lhsmat = [zeros(1, ny+3); temp1_a; zeros(1, ny+3)];
lhsmat(1,1) = 1;
lhsmat(np+3, np+3) = 1;

