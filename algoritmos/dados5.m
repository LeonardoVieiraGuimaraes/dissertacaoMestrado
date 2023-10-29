clear all;
close all;
for i = 1:5

    treino = imageDatastore ({sprintf('novo/treino%i/treino/v',i),sprintf('novo/treino%i/treino/r',i),...
    sprintf('novo/treino%i/treino/i',i)},'LabelSource','foldernames');
    teste = imageDatastore ({sprintf('novo/treino%i/validacao/v',i),sprintf('novo/treino%i/validacao/r',i),...
    sprintf('novo/treino%i/validacao/i',i)},'LabelSource','foldernames');

    extractorFcn = @exampleBagOfFeaturesExtractor3;
   
    B = bagOfFeatures(treino,'CustomExtractor',extractorFcn,'VocabularySize',100,'StrongestFeatures',0.8);
    T = encode(B,treino);
    V = encode(B,teste);
    ET = double(treino.Labels);
    EV = double(teste.Labels);
    
    dlmwrite(sprintf('treino2%i.txt',i), T,' ');
    dlmwrite(sprintf('validacao2%i.txt',i), V,' ');
    dlmwrite(sprintf('Etreino2%i.txt',i), ET,' ');
    dlmwrite(sprintf('Evalicacao2%i.txt',i), EV,' ');
    
end

