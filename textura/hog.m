function [X, Y] = hog(imagem)

    im = imread(imagem);
    I = rgb2gray(im);
    
    Mx = [-1 0 1];
    My = [-1 0 1];
    
    [X,Y] = extractHOGFeatures(I);
    figure;
    imshow(I)
    hold on;
    plot(Y);
end
    
