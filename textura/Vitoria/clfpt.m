function [X, E1] = clfpt(imagem, P, R, d)
    
    Pesos = clbpt(imagem,P,R);
    Pesos = double(Pesos);
    im = imread(imagem);
    
    I = rgb2gray(im);
    I = double(I);
    
    [m n] = size(I);
    
   
    c = round(R);
    U = zeros(m,n);
   
    
    for xc = c+1:m-c
        for yc = c+1:n-c
            gc = I(xc,yc);
            gcp = Pesos(xc,yc);
            p = 0;
            for i=1:P
                
                x = round(xc + R*cos(2*pi*p/P));
                y = round(yc - R*sin(2*pi*p/P));
                gp(i) = I(x,y);
                gpc(i) = Pesos(x,y);
                
               
                p = p+1;
            end
            Pe = [gcp gpc];
            %fg = trimf([gc gp],[gc-d gc gc+d]);
            %fg = trapmf([gc gp],[gc-d,gc,gc,gc+d]);
            fg = gaussmf([gc gp],[d gc]);
            U(xc,yc) = (sum(fg.*Pe)/sum(Pe));
        end
    end
    
    X = U;
    figure
    imshow(X);
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
    E1 = E1(:)'; 
end