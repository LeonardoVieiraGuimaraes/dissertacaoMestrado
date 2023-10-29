close all;
clear all;
%analise e energia conraste e homogeniedade
%www.danilorvieira.com

im1 = imread('DSCN9180.jpg');
im1g = rgb2gray(im1);


im3 = imcrop(im1g);
level = graythresh(im3);
BW = im2bw(im3,level);
[B L N A] = bwboundaries(BW);

im1g2 = im3.*(uint8(BW));
IB = edge(im3, 'Canny');

imagesc(im1g2);
%[H, T, R] = hough(IB, 'RhoResolution', 2);

figure
imshow(im3)
title('imagem')
figure
imshow(im3);
title('corte');
figure
imshow(IB);
title('segmentada');
figure
imshow(BW);
title('otsu');

figure
imshow(im1g2);
title('otsu');

figure
imshow(label2rgb(L, @jet, [.5 .5 .5]));

hold on
for k = 1:length(B)
  boundary = B{k};
  plot(boundary(:,2), boundary(:,1), 'black', 'LineWidth', 2);
end


stats = regionprops(L, 'Area','Perimeter');
qtd_azuis = sum([stats.Area] > 3000);
hold on
for k = 1:length(B)
    area = stats(k).Area;

    if area > 3000
        boundary = B{k};
        plot(boundary(:,2), boundary(:,1), 'black', 'LineWidth', 2);
        text(boundary(1,2), boundary(1,1), sprintf('%.0f',area),...
            'Color', 'white',...
            'FontSize', 12,...
            'FontWeight', 'bold',...
            'BackgroundColor', 'black');
    end
end
hold off


%figure(3);
%imshow(H,[], 'XData',T,'Ydata',R,'InitialMagnification','fit');
%title('hough');
%axis on, axis normal, hold on

bw6 = imopen(BW, strel('disk',10));
bw6 = imerode(BW, strel('disk',20));
imshow(bw6);