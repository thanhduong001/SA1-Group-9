function [infa, infb] = refpaninf(del,Xm,Ym_in)
    error = (abs(Ym_in) < 1e-6);
    Ym = Ym_in - Ym_in .* error + error * 1e-6;

    I0 = -(1/(4*pi))*(Xm.*log(Xm.^2+Ym.^2)-(Xm-del).*log((Xm-del).^2+Ym.^2)-2*del+2*Ym.*(atan(Xm./Ym)-atan((Xm-del)./Ym)));
    I1 = (1/(8*pi))*((Xm.^2+Ym.^2).*log(Xm.^2+Ym.^2)-((Xm-del).^2+Ym.^2).*log((Xm-del).^2+Ym.^2)-2*Xm*del+del^2);
    infa = ((1-Xm/del).*I0 - I1./del);
    infb = (Xm/del.*I0 + I1/del);
end