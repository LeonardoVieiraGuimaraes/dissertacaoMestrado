clear all;
close all;

clear all;
close all;
tt = 1;
arquivo = fopen('LBP_RedeGlobe.txt', 'w+');
for t = 0:6:24
    for n = 1:30
        filename = sprintf('RedGlobe_%dh_%d.jpg',t,n);
        I = imread(filename);
        C = rgb2gray(I);
        features  = extractLBPFeatures(C,'upright',false);
        temp = [var(features) tt 2];
        fprintf(arquivo, '%d ' , temp);   
        fprintf(arquivo,'\n');
    end
    tt = tt + 1;
end
         
     

