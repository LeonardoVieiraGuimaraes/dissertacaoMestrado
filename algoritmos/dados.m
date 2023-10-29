clear all;
close all;
arquivo = fopen('italialbp.txt', 'w+');
escala = 8
for t = 0:6:24
    for n = 1:30
        filename = sprintf('italia_%dh_%d.jpg',t,n);
        I = imread(filename);
        R = I(:,:,1);
        G = I(:,:,2);
        B = I(:,:,3);
        
        for k = 1:escala
            r = r + 1;
            v = v+
            
            MR = extractLBPFeatures(brickWall,'Upright',false,'Radius',r, 'NumNeighbors', v);
        
        M = [MR MG MB MC t 3];
        
       
        
        fprintf(arquivo, '%d ' , M, '\n');   
        fprintf(arquivo,'\n');
           

    end
end

