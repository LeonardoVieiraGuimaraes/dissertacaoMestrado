
clear all;
close all;
for i = 1:30
I = imread('24.jpg');
x = 10;
y = 15;
I3 = imcrop(I);
filename = sprintf('R_24h_%d.jpg',i);
imwrite(I3,filename);
end