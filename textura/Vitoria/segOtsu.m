clear all;
close all;

I = imread('vitoria_18h_18.jpg');
figure
imshow(I)
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

C = rgb2gray(I);

figure
imshow(C);

%background = imopen(B,strel('disk',15));

% Display the Background Approximation as a Surface
%figure
%surf(double(background(1:8:end,1:8:end))),zlim([0 255]);
%ax = gca;
%ax.YDir = 'reverse';

%I2 = B - background;
%imshow(I2)

%I3 = imadjust(I2);
%figure
%imshow(I3);
level = graythresh(C);
bw = imbinarize(C,level);
%bw = imopen(bw, strel('disk',10));
%bw = imerode(bw, strel('disk',1));

%bw = bwareaopen(bw, 50);
figure
imshow(bw)
