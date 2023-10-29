for t = 0:6:24
        for n = 1:30
            I = imread(sprintf('R_%ih_%i.jpg',n,t));
            
            imwrite(I,sprintf('R_%ih_%i.jpg',t,n));
            delete(sprintf('R_%ih_%i.jpg',n,t));
            
        end
end