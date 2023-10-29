function [X, E1]  = clbpt(imagem, P, R )
    im = imread(imagem);
    I = rgb2gray(im);
    I = double(I);
    
    [m,n] = size(I);
    X = zeros(m,n);
    c = round(R+1);
    
    for xc = c+1:m-c
        for yc = c+1:n-c
            gc = I(xc,yc);
            
            for p=1:P
                x = round(xc + R*cos(2*pi*(p-1)/P));
                y = round(yc - R*sin(2*pi*(p-1)/P));
                gp(p) = I(x,y);
            end
            M = abs(gp);
            M = mean(M)-M;
            k = 0;
            for p=1:P
                if (gp(p) - gc)<=0 
                    s = 0;
                else
                    s = 1;
                end
                    
                S(k+1) = s*(2^k);
                k = k+1;
                if (gp(p) - gc)<=M(p)
                    s = 0;
                else 
                    s = 1;
                end
                
                S(k+1) = s*(2^k);
                k = k+1;
            
                
                
                
            end
             
            
            
             X(xc,yc) = sum(S)./(2^(P*2)); 
             
             
        end
    end
      
    %X = uint8(X);
    %figure
    %imshow(X);
    cel = [39 39];
    bin = P+2;
    %E(:,:,:) = reshape(X,8,8,[]);
    
    %mx = sqrt(prod(floor(size(X)/cel(1))));
    %nx = sqrt(prod(floor(size(X)/cel(2))));
    [mx nx] = size(X);
    %im = floor(mx/cel(1))
    %jn = floor(nx/cel(2))
    k = 0;
   
    for i = 1:cel(1):mx
        for j = 1:cel(2):nx
            k = k+1;
            E = X(i:i+cel(1)-1,j:j+cel(2)-1);
            
            E1(k,:) = imhist(E,bin)';
            %E1 = normalizarl(E1);
            
        
        end
    end
      %E1 = E1./sum(E1);
      E1 = E1(:)';
end