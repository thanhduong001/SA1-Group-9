function He = laminar_He(H)
%
%  function He = laminar_He(H)
%
%  Provides energy shape factor He as function of shape factor H.
%  Based on Eppler & Somers' expressions for H(He).
%  For H < 1.855:              He = 1.742
%      1.855 < H < 2.591       1.742 > He > 1.573 (analytical inversion)
%      2.591 < H < 4.029       1.573 > He > 1.515 (iterative inversion)
%

    % if H <= 1.855 
    %     He = 89.582142/(2*25.715786);
    % elseif H <= 2.5911
    %     He = (89.582142 - sqrt(89.582142^2 - 4*25.715786*(79.870845-H)))/(2*25.715786);
    % else
    %     He = 1.545;
    %     Heold = 0;
    %     while abs(He-Heold) > 0.0005
    %         dum = (4.02922 - H)/(583.60182 - 724.55916*He + 227.1822*He^2);
    %         Heold = He;
    %         He = 1.51509 + dum^2;
    %     end
    % end
    a = (H <= 1.855);
    b = (1.855 < H) .* (H <= 2.5911);
    c = 1-a-b;

    T1 = 89.582142/(2*25.715786)*a;
    T2 = (89.582142 - sqrt(89.582142^2 - 4*25.715786*(79.870845-H))) /(2*25.715786) .* b;

    for i = 1:size(H)
        He = 1.545;
        Heold = 0;
        while abs(He-Heold) > 0.0005
            dum = (4.02922 - H(i))/(583.60182 - 724.55916*He + 227.1822*He^2);
            Heold = He;
            He = 1.51509 + dum^2;
        end
    end
    T3 = He*c;

    He = T1 + T2 +T3;
end