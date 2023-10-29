clear all;
close all;
arquivo = fopen('italia.txt', 'w+');

for t = 0:6:24
    for n = 1:30
        filename = sprintf('italia_%dh_%d.jpg',t,n);
        I = imread(filename);
        R = I(:,:,1);
        G = I(:,:,2);
        B = I(:,:,3);
        C = rgb2gray(I);
        
        MR = mean(mean(R(:,1:length(R))));
        MG = mean(mean(G(:,1:length(G))));
        MB = mean(mean(B(:,1:length(B))));
        MC = mean(mean(C(:,1:length(C))));
        
        M = [MR MG MB MC t 3];
        
       
        
        fprintf(arquivo, '%d ' , M);   
        fprintf(arquivo,'\n');
           

    end
end

