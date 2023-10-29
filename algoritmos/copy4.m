clear all;

for i = 1:5
    for t = 0:6:24
        w = 1;
        mkdir(sprintf('novo/v/treino%d/treino/%d',i,t));
        mkdir(sprintf('novo/r/treino%d/treino/%d',i,t));
        mkdir(sprintf('novo/i/treino%d/treino/%d',i,t));
        mkdir(sprintf('novo/v/treino%d/validacao/%d',i,t));
        mkdir(sprintf('novo/r/treino%d/validacao/%d',i,t));
        mkdir(sprintf('novo/i/treino%d/validacao/%d',i,t));
        for n = 0:29     
            if w ~= i
                copyfile(sprintf('Vitoria/V_%dh_%d.jpg',t,n+1),sprintf('novo/v/treino%d/treino/%d',i,t)); 
                copyfile(sprintf('Red Globe/R_%dh_%d.jpg',t,n+1),sprintf('novo/r/treino%d/treino/%d',i,t)); 
                copyfile(sprintf('Italia/I_%dh_%d.jpg',t,n+1),sprintf('novo/i/treino%d/treino/%d',i,t));
            
            end
            if w == i
                copyfile(sprintf('Vitoria/V_%dh_%d.jpg',t,n+1),sprintf('novo/v/treino%d/validacao/%d',i,t));
                copyfile(sprintf('Red Globe/R_%dh_%d.jpg',t,n+1),sprintf('novo/r/treino%d/validacao/%d',i,t));
                copyfile(sprintf('Italia/I_%dh_%d.jpg',t,n+1),sprintf('novo/i/treino%d/validacao/%d',i,t));
            end
            v = mod(n,6);
            if v == 5
                w = w+1;
            end
        end
    end
end