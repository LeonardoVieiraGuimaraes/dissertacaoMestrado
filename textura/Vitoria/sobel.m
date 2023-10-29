    clear all;
    I = imread('serro.bmp');
    I = rgb2gray(I);
    [m, n] = size(I);
    [Gx1, Gy1] = imgradientxy(I);
    [Gmag, Gdir] = imgradient(I,'Sobel');
    Gmag = uint8(Gmag);
    Gdir = uint8(Gdir);
    
    [mg ng] = size(Gmag);
    
    
    
    
   reshape( 
    
    
    [valor,indice] = imhist(Gmag,9);
    
  
    
    
    
    
    
    
   
    
    
    
    
    
    
    
    %imshow(uint8([Gx1 Gy1]))
    
    %[m,n] = size(I);
    %Gx = [1 0 -1; 2 0 -2; 1 0 -1];
    %Gy = [-1 -2 -1; 0 0 0; 1 2 1];
    %GX = filtrolinear(I,Gx);
    %GY = filtrolinear(I,Gy);
    %G = sqrt(GX.^2 + GY.^2);
    
    
    %[m,n] = size(GX);
    %for i = 1:m
    %    for j = 1:n
    %        if GX(i,j) == 0
    %            GX(i,j) = 0.000001;
    %        end
    %    end
    %end
    
   
    
    %o = atan(GY./GX);
   
    %GX = uint8(GX);
    %GY = uint8(GY);
    %G = uint8(G);
    
    
    %imshow([GX GY G])
    
    

    