clear all;
close all;

I = imread('vitoria_18h_18.jpg');
figure
imshow(I);
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

nrows = size(R,1);
ncols = size(R,2);

R = double(R(:));
G = double(G(:));
B = double(B(:));

RGB = [R G B];
nColors = 3;
[cluster_idx, cluster_center] = kmeans(RGB, nColors, 'distance','sqEuclidean', 'Replicates',3);

pixel_labels = reshape(cluster_idx,nrows,ncols);
imshow(pixel_labels,[]), title('image labeled by cluster index');

