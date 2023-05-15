function psixy = psipv(xc,yc,Gamma,x,y)
    r2 = (x-xc)^2 +(y-yc)^2;
    psixy = -Gamma/(4*pi)*log(r2);
end
