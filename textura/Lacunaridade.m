function lac = Lacunaridade(imagem,l)
    im = imread(imagem);
    im = rgb2gray(im);
    [ny, nx] = size(im);
    n_pixels = l*l;
    hi = zeros(1,n_pixels+1);
    for y = 1:ny-l+1
        for x = 1:nx-l+1
           m = im(y:(y+l-1),x:(x+l-1));
            me = sum(sum(m))/n_pixels;
            
            n_elem = find(m>=me);
            n_elem=length(n_elem)+1;
            hi(n_elem) = hi(n_elem)+1;
        end;
    end;
    
    hi = hi/sum(hi);
    v = 0:n_pixels;
    
    Z1 = sum(v.*hi);
    Z2 = sum((v.^2).*hi);
    
    lac = Z2/(Z1.^2);
    
    
    
end