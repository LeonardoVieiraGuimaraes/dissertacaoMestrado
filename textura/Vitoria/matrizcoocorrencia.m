function X = matrizcoocorrencia(IM)
   
    MC = graycomatrix(IM,'offset', [0 1; -1 1; -1 0; -1 -1], 'NumLevels',256, 'GrayLimits',[0 255],'Symmetric',true);
    s = graycoprops(MC,{'Energy','Homogeneity','Correlation','Contrast'});
    
    
    X = [s.Energy s.Homogeneity s.Correlation s.Contrast];
end