clear all;
close all;

he = imread('DSCN9179.jpg');
figure
imshow(he);

%converte a imagem RGB para Lab 
cform = makecform('srgb2lab');
lab_he = applycform(he,cform);
figure
imshow(lab_he)

%classifica as corres a e b usando Knn

ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);


nColors = 3;

%repetir os argumentos treis vezes para evitar o minimo local

[cluster_idx, cluster_center] = kmeans(ab, nColors, 'distance','sqEuclidean',...
    'Replicates',5);

% Rotule para cada pixels da imagem usando o resultado para kmeans

pixel_labels = reshape(cluster_idx,nrows,ncols);
figure
imshow(pixel_labels,[]);

%crea imagens que segmenta H&E imagem para cores
segmented_imagens = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors 
    color = he;
    color(rgb_label ~= k) = 0;
    segmented_imagens{k} = color; 
end
figure
imshow(segmented_imagens{1});

figure
imshow(segmented_imagens{2});

figure
imshow(segmented_imagens{3});

figure
imshow(segmented_imagens{4});


