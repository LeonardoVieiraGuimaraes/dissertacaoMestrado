close all;
tt = 1;
arquivo = fopen('Textura_Vitoria.txt', 'w+');
for t = 0:6:24
    for n = 1:30
        filename = sprintf('vitoria_%dh_%d.jpg',t,n);
        [X temp] = clfpt(filename,16,2,5);
       
        
       
        M = [temp tt 1];
        fprintf(arquivo, '%d ' , M);   
        fprintf(arquivo,'\n');
    end
    tt = tt + 1;
end