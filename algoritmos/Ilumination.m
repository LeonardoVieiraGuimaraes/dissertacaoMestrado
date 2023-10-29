clear all;
close all;

I = imread('DSCN9162.jpg');
I = rgb2gray(I);
figure
imshow(I);

background = imopen(I,strel('disk',15));

I2 = I - background;
figure
imshow(I2)

%I2 = imtophat(I,strel('disk',15));
I3 = imadjust(I2);
figure
imshow(I3);

bw = imbinarize(I3);
bw = bwareaopen(bw, 50);
figure
imshow(bw)

cc = bwconncomp(bw, 4);

grain = false(size(bw));
grain(cc.PixelIdxList{50}) = true;
figure
imshow(grain);