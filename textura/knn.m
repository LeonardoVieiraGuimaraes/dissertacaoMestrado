function C = knn(test, trein, grupo, k)
    
   Mdl = fitcknn(trein,gupo,'NumNeighbors',k,'Standardize',1)


end
