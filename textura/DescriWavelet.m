function [Ene, Ent, Me] = DescriWavelet(I,N,wave)
    %Descri_Wavelet2('figura_3.jpg',3,'db4')
    im = imread(I);
   
   
    [C, S] = wavedec2(im,N,wave);
    
    Ene = [];
    Ent = [];
    Me = [];
    figure
    imshow(S)
    tam = S(1,1)*S(1,2);
    C(1:tam) = [];
   
    
    for y = 1:N
        tam = S(y+1,1)*S(y+1,2);
        for x =1:3
            temp = C(1:tam);
            C(1:tam)=[];
            Ene = [Ene sum(temp.*temp)]
            c = find(temp>0)
            Ent = [Ent - sum(temp(c).*log(temp(c)))];
            Me = [Me mean(temp)];
        end
    end
end