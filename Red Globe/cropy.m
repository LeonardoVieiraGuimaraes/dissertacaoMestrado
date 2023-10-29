
clear all;
close all;
for j = 0:6:24
    for i = 1:30
        I = imread(sprintf('%i.jpg',j));
        I3 = imcrop(I);
        imwrite(I3,sprintf('R_%ih_%i.jpg',i,j));
    end
    close all;
end