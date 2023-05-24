function dthickdx = thickdash(xmx0,thick)
    global Re ue0 duedx
    ue = ue0 + duedx * xmx0;
    He = thick(2)/thick(1);
    if He >= 1.46
        H = (11 * He + 15)/(48 * He - 59);
    else
        H = 2.803;
    end
    Rethet = Re * ue * thick(1);
    cf = 0.091448*((H - 1)*Rethet)^-0.232 * exp(-1.26 * H);
    cdiss = 0.010023 * ((H - 1) * Rethet) ^ (-1/6);
    dthickdx(1,1) = cf/2 - (H + 2)/ue * duedx * thick(1);
    dthickdx(2,1) = cdiss - (3/ue) * duedx * thick(2);
    
