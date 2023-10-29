function [N Z] = normalizard(M);
    [m n] = size(M);
    
    v_min =0;
    v_max =1;
    
    for i=1:m
        N(i,:) = (M(i,:)-mean(M(i,:)))/std(M(i,:));
    end
    
    Z = zscore(M);

end