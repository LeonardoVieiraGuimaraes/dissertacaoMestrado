clear all;
I = imread('figura_3.jpg');
I = double(I);
[m n s] = size(I);

D = I(:,:,1);
mesh(D)