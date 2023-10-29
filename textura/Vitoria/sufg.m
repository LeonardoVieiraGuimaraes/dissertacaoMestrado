clear all;
close all;
tt = 1;
arquivo = fopen('Textura_Vitoria3.txt', 'w+');
for t = 0:12:24
    for n = 1:30
        filename = sprintf('vitoria_%dh_%d.jpg',t,n);
        I = imread(filename);
        im = rgb2gray(I);
        p = detectSURFFeatures(im);
        
        temp = p.SignOfLaplacian(20)';
        
       
        
       
        M = [temp tt 1];
        fprintf(arquivo, '%d ' , M);   
        fprintf(arquivo,'\n');
    end
    tt = tt + 1;
end