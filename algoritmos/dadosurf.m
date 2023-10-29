clear all;
close all;
arquivo = fopen('italiasurf.txt', 'w+');
escala = 100;
tt = 0;
for t = 0:6:24
    for n = 1:30
        tt = tt + 1;
        filename = sprintf('italia_%dh_%d.jpg',t,n);
        I = imread(filename);
        R = I(:,:,1);
        G = I(:,:,2);
        B = I(:,:,3);
        
        
        
        %for k = 1:escala
        %    r = r + 1;
            
            
            %MR = extractLBPFeatures(R,'Upright',false,'Radius',r, 'NumNeighbors', v);
            %MG = extractLBPFeatures(G,'Upright',false,'Radius',r, 'NumNeighbors', v);
            %MB = extractLBPFeatures(B,'Upright',false,'Radius',r, 'NumNeighbors', v);
           
            SA1 = detectSURFFeatures(R,'MetricThreshold',1000);
            SA2 = detectSURFFeatures(G,'MetricThreshold',1000);
            SA3 = detectSURFFeatures(B,'MetricThreshold',1000);
            
            MR = extractFeatures(R,SA1);
            MG = extractFeatures(G,SA2);
            MB = extractFeatures(B,SA3);
            
            M = [MR; MG; MB];
            ims = imageDatastore(MR);
            bag = bagOfFeatures(ims);
            
            %fprintf(arquivo, '%d ' ,MR); 
            %fprintf(arquivo, '3 %d \n', tt);
            %fprintf(arquivo, '%d ' ,MG); 
            %fprintf(arquivo, '3 %d \n', tt);
            %fprintf(arquivo, '%d ' ,MB); 
            %fprintf(arquivo, '3 %d \n', tt);
          
           
            
            
        %end
        
       
       
        
        

    end
end
imageDatastore