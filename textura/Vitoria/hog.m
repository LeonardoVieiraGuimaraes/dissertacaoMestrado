function [X, Y] = hog(imagem)

    im = imread(imagem);
    I = rgb2gray(im);
    
 
 
    [X,Y] = extractHOGFeatures(I);
   
end
    
