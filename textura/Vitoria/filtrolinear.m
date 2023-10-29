function IA = filtrolinear(C,A)
%Filtro depende da mascara para termos diferentes tipos de filtro. 
%Passa Baixa: Filtram altas frequências (media)
%Passa Alta: Filtragem de baixas frequências (laplaciana)
%Passa-faixa - filtra a frequencia em uma determinada faixa.
    C = double(C);
    [cm, cn] = size(C);
   
    K = zeros(cm+2,cn+2);
    K(cm+2,cn+2) = 1;
    K(2:cm+1,2:cn+1) = C;
    I = K;    
    [l,c] = size(I);
    n = size(A,1);
    m =floor(n/2);
    
    
    IA = zeros(l,c);
   
    for i = (m+1):(l-m)
        for j = (m+1):(c-m)
            for h = -m:m
                for k = -m:m
                    IA(i,j) = IA(i,j) + A(h+m+1,k+m+1)*I(i-h,j-k);
                end
            end
        end
    end
    if (sum(sum(A))>0)
        IA = IA/sum(sum(A));
        
    end
end