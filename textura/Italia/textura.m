clear all;
close all;
tt = 1;
arquivo = fopen('Textura_Italia3.txt', 'w+');
for t = 0:12:24
    for n = 1:30
        filename = sprintf('italia_%dh_%d.jpg',t,n);
        I = imread(filename);
        R = I(:,:,1);
        G = I(:,:,2);
        B = I(:,:,3);
       
        tempR = extractLBPFeatures(R);
        tempG = extractLBPFeatures(G);
        tempB = extractLBPFeatures(B);
        
        temp = [tempR tempG tempB];
        
       
        
       
        M = [temp tt 1];
        fprintf(arquivo, '%d ' , M);   
        fprintf(arquivo,'\n');
    end
    tt = tt + 1;
end