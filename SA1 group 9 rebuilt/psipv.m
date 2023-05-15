function psixy = psipv(xc,yc,Gamma,xm,ym)
    r2 = (xm-xc).^2 +(ym-yc).^2;
    psixy = -Gamma/(4*pi)*log(r2);
end
