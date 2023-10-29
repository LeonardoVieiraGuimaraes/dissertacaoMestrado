clear all;
close all;
tt = 1;
arquivo = fopen('Textura_Vitoria.txt', 'w+');
for t = 0:6:24
    for n = 1:30
        filename = sprintf('vitoria_%dh_%d.jpg',t,n);
        I = imread(filename);
        C = rgb2gray(I);
        [glcms_img si_img] = graycomatrix(C,'offset',[0 1; -1 1; -1 0; -1 -1; 1 0; 1 1 ; 1 -1; 0 -1]);
        prop_img = graycoprops(glcms_img,{'contrast','correlation','homogeneity','energy'});
        temp = [mean(prop_img.Contrast ) mean(prop_img.Homogeneity) mean(prop_img.Energy) mean(prop_img.Correlation)];
        temp = [temp tt 1];
        fprintf(arquivo, '%d ' , temp);   
        fprintf(arquivo,'\n');
    end
    tt = tt + 1;
end
         
         