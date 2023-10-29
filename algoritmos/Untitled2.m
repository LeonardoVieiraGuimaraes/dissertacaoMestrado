%clear all;
%close all;

%imagem = imread('DSCN9162.jpg');
%im = imagem(:,:,3);
%imadjust
%histeq
%im = imadjust(imagem,[.2 .3 0; .6 .7 1],[]);
im = rgb2gray(imagem);
im = imagem1;
figure
%imhist(im);
level = graythresh(im);
imCoin = (im > level);

figure 
imshow(BW)
BW = imopen(BW, strel('disk',20));
BW = imerode(im, strel('disk',20));
BW = imbinarize(im, 'adaptive','ForegroundPolarity','dark','Sensitivity',0.4);
figure
imshow(edge(im, 'zerocross'));
figure
imshow(BW)
BW = imerode(BW, strel('disk',20));
figure 
imshow(BW)
BW = imopen(BW, strel('disk',20));


figure
imshow(BW)

%imCoin = (BW > level);

blobAnalysis = vision.BlobAnalysis('AreaOutputPort', true,...
    'CentroidOutputPort', true,...
    'BoundingBoxOutputPort', true,...
    'MinorAxisLengthOutputPort', 6000, 'ExcludeBorderBlobs', true);
[Area, Centroide, Boxes] = step(blobAnalysis, BW);

% Sort connected components in descending order by area
%[A , idx] = sort(Area, 'Descend');

% Get the two largest components.
%Boxes = double(Boxes(idx, :));


% Reduce the size of the image for display.
scale = 25 / 100;
imDetectedCoins = imresize(imagem, scale);


% Insert labels for the coins.
imDetectedCoins = insertObjectAnnotation(imDetectedCoins, 'rectangle', ...
    scale * Boxes, 'penny');

figure; 
imshow(imDetectedCoins);
title('Detected Coins');

for i = 1:length(Boxes')
    %Corrdenadas do canto esquerdo 
    x = Boxes(i,1);
    y =  Boxes(i,2);
    largura = Boxes(i,3); %terceira coluna largura 
    altura =  Boxes(i,4); %quarta coluna altura 
    
    filename = sprintf('figura%d.jpg',i);

    %figure
    %imshow(BW(y:(y+altura),x:(x+largura)))
    BW = uint8(BW);
    im1 = imagem(y:(y+altura),x:(x+largura),1).*BW(y:(y+altura),x:(x+largura));
    im2 = imagem(y:(y+altura),x:(x+largura),2).*BW(y:(y+altura),x:(x+largura));
    im3 = imagem(y:(y+altura),x:(x+largura),3).*BW(y:(y+altura),x:(x+largura));
    imagem2 = cat(3,im1,im2,im3);
    imwrite(imagem2, filename);
end
