function [u1, u2, u3, u4, en, ent] = estatistico(X)
%Descritores baseados em histograma
    [m n] = size(X);
    H = myhist(X);
    p = H./(m*n);

    [mh nh] = size(H);

    i = 0:nh-1;
    u1 = sum(i.*p);
    u2 = sum(p.*(i - u1).^2);
    u3 = (u2^(-3))*sum(p.*(i-u1).^3);
    u4 = (u2^(-4))*sum(p.*(i-u1).^4-3);
    en = sum(p.^2);
    ent = -sum(p.*log2(p + 0.00000000000001));
end


