function [Vx,Vy,DF] = BoxCounting(imagem,caixas)
    im = imread(imagem);
    im = rgb2gray(im);
    im = double(im);
    Vx = [];
    Vy = [];
    for ca = caixas
        Vx = [Vx; log(ca)];
        Vy = [Vy; log(ContaCaixa(im,ca))];
    end
    P = polyfit(Vx, Vy, 1);
    DF = -P(1);
end