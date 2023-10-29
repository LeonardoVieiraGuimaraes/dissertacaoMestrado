function desc = DescForierText(imagem)
    im = imread(imagem);
    im = rgb2gray(im);
    
    f = fft2(im);
    f = abs(f);
    f = f/f(1,1);
    f(1,1) = 0;
    f = fftshift(f);
    
    [m n] = size(f);
    tam = fix(min(size(f))/2-1);
   
    desc = zeros(1,tam);
    
    for raio = 1:tam
        mascara = calculaCirculo(m,n,raio);
        magDesc = f.*mascara;
        if (raio ==1)
            desc(raio) = sum(magDesc(:));
        else 
            desc(raio) = sum(magDesc(:)) - desc(raio - 1);
        end
    end
    
end
