function N = normalizarl(M)
    [m n] = size(M);
    
    v_min =0;
    v_max =1;
    
    for i=1:m
        N(i,:) = ((v_max-v_min)*(M(i,:)-min(M(i,:))))/(max(M(i,:))-...
            min(M(i,:))) + v_min;
    end
    
end