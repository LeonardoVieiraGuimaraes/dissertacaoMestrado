
F = load('C:\Users\Leonardo\Google Drive\2_Semestre\Dissertação\RGB_12\Italia\italialbp.txt');

FF = F(:,1:end-2);

[m,n] = size(FF);
imagens = 150;
B=5;

[id, centers] = kmeans(double(FF), B);

H=zeros(imagens,B);

for i=1:45000
    k=ceil(i/300);
    H(k,id(i))=H(k,id(i))+1;
    
end

for i=1:imagens
    H(i,:)=H(i,:)/sum(H(i,:));
    
end

H(1:30,B+1) = 1;
H(31:60,B+1) = 2;
H(61:90,B+1) = 3;
H(91:120,B+1) = 4;
H(121:150,B+1) = 5;

    
