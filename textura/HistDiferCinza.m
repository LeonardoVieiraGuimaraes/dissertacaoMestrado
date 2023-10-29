function [hi x] = HistDiferCinza(imagem,dis,direc)
    I = imread(imagem);
    I = rgb2gray(I);
    im = double(I);
    switch(direc)
        case 1
            difer = im(:,1:end-dis) - im(:,1+dis:end);
        case 2 
            difer = im(1:end-dis,:) - im(1+dis:end,:);
        case 3 
             difer = im(1:end-dis,1:end-dis) - im(1+dis:end,1+dis:end);
        case 4 
            difer = im(1:end-dis,1+dis:end) - im(1+dis:end,1:end-dis);
    end
    
    [hi,x] = imhist(uint8(abs(difer)));

end
