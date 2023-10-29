



I = imread('RedGlobe_24h_30.jpg');
T1 = rgb2gray(I);
[row, col] = size(C);
for i = 1:col
    for j = 1:row
        img = T1(i, j); 
        [glcms_img si_img] = graycomatrix(img,'offset',[0 1; -1 1; -1 0; -1 -1; 1 0; 1 1 ; 1 -1; 0 -1]);
        prop_img = graycoprops(glcms_img,{'contrast','correlation','homogeneity','energy'});
        
    end
end