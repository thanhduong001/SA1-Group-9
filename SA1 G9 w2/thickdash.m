function dthickdx = thickdash(xmx0,thick)
    global Re ue0 duedx
    He = thick(1)/thick(2);
    if He >= 1.46
        H = (11 * He + 15)/(48 * He - 59);
    else
        H = 2.803;
    end
    Rethet = Re * ue0 *     
    cf = 0.091448*((H - 1)*Rethet)^-0.232 * exp(-1.26 * H);
   
