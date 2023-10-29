function mascara = calculaCirculo(tamy, tamx, raio)
    y0 = round(tamy/2+1);
    x0 = round(tamx/2+1);
    
    mascara = zeros(tamy, tamx);
    
    erro = 1 - raio;
    erroY = 1;
    erroX = -2*raio;
    
    x = raio; 
    y = 0; 
    
    mascara(y0-raio:y0+raio,x0) = 1;
    mascara(y0,x0-raio:x0+raio) = 1;
    
    while(y<x)
        if (erro >0)
            x = x -1;
            erroX = erroX + 2;
            erro = erro + erroX;
        end
        y = y+1;
        erroY = erroY +2;
        erro = erro + erroY;
        mascara(y0 + y, x0 - x: x0+x)=1;
        mascara(y0 - y, x0 - x: x0+x)=1;
        mascara(y0 + x, x0 - y: x0+y)=1;
        mascara(y0 - x, x0 - y: x0+y)=1;
    end
end