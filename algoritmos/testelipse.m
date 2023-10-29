clear all;
close all;
imagem = imread('DSCN9162.jpg');
im = rgb2gray(imagem);

hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(im), hy, 'replicate');
Ix = imfilter(double(im), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);
figure
imshow(gradmag,[])

L = watershed(gradmag);
Lrgb = label2rgb(L);
figure, imshow(Lrgb)

se = strel('disk', 20);
Io = imopen(im, se);
figure
imshow(Io)

Ie = imerode(im, se);
Iobr = imreconstruct(Ie, im);
figure
imshow(Iobr)

Ioc = imclose(Io, se);


cut(
figure
imshow(Ioc)

Iobrd = imdilate(Iobr, se);
Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);
figure
imshow(Iobrcbr)

fgm = imregionalmax(Iobrcbr);
figure
imshow(fgm)

I2 = im;
I2(fgm) = 255;
figure
imshow(I2)

se2 = strel(ones(5,5));
fgm2 = imclose(fgm, se2);
fgm3 = imerode(fgm2, se2);

fgm4 = bwareaopen(fgm3, 20);
I3 = im;
I3(fgm4) = 255;
figure
imshow(I3)

bw = imbinarize(Iobrcbr);
figure
imshow(bw)

D = bwdist(bw);
DL = watershed(D);
bgm = DL == 0;
figure
imshow(bgm)

gradmag2 = imimposemin(gradmag, bgm | fgm4);

L = watershed(gradmag2);

I4 = im;
I4(imdilate(L == 0, ones(3, 3)) | bgm | fgm4) = 255;
figure
imshow(I4)

Lrgb = label2rgb(L, 'jet', 'w', 'shuffle');
figure
imshow(Lrgb)

figure
imshow(im)
hold on
himage = imshow(Lrgb);
himage.AlphaData = 0.3;