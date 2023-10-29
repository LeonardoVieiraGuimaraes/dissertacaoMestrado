clear all;
for i = 1:5
    k = 0;
    for t = 0:6:24
        k = k + 1;
        w = 1;
        for n = 0:29
            if w ~=i    
                copyfile(sprintf('Vitoria/vitoria_%dh_%d.jpg',t,n+1),sprintf('Treino%d/treino/%d',i,k)); 
                copyfile(sprintf('Red Globe/RedGlobe_%dh_%d.jpg',t,n+1),sprintf('Treino%d/treino/%d',i,k)); 
                copyfile(sprintf('Italia/italia_%dh_%d.jpg',t,n+1),sprintf('Treino%d/treino/%d',i,k));
            end
            if w == i
                copyfile(sprintf('Vitoria/vitoria_%dh_%d.jpg',t,n+1),sprintf('Treino%d/teste/%d',i,k));
                copyfile(sprintf('Red Globe/RedGlobe_%dh_%d.jpg',t,n+1),sprintf('Treino%d/teste/%d',i,k));
                copyfile(sprintf('Italia/italia_%dh_%d.jpg',t,n+1),sprintf('Treino%d/teste/%d',i,k));
            end
             v = mod(n,6);
            if v == 5
                w = w+1;
            end
        end
    end
end