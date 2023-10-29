function X = descr_hist(imagem)
    I = imread(imagem);
    I = rgb2gray(I);
    
    [m n] = size(I);
    [contagem indices] = imhist(I);
    p = contagem/(m*n);
    
    md = sum(indices.*p);
    vr = sum((indices-md).^2.*p);
    as = sqrt(vr)^(-3)*sum((indices-md).^3.*p);
    ct = sqrt(vr)^(-4)*sum((indices-md).^4.*p);
    en = sum(p.^2);
    c = 0.1;
    et = -sum(p.*log2(p+c));
    
    X = [md,vr,as,ct,en,et];

end