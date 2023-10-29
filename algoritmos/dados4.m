clear all;
close all;
for i = 1:5

    treino = imageDatastore ({sprintf('Treino%i/treino/1',i),sprintf('Treino%i/treino/2',i),...
    sprintf('Treino%i/treino/3',i),sprintf('Treino%i/treino/4',i),sprintf('Treino%i/treino/5',i)},...
    'LabelSource','foldernames');
    teste = imageDatastore ({sprintf('Treino%i/teste/1',i),sprintf('Treino%i/teste/2',i),...
    sprintf('Treino%i/teste/3',i),sprintf('Treino%i/teste/4',i),sprintf('Treino%i/teste/5',i)},...
    'LabelSource','foldernames');

    extractorFcn = @exampleBagOfFeaturesExtractor3;
   
    B = bagOfFeatures(treino,'CustomExtractor',extractorFcn,'VocabularySize',100,'StrongestFeatures',0.8);
    T = encode(B,treino);
    V = encode(B,teste);
    ET = double(treino.Labels);
    EV = double(teste.Labels);
    
    dlmwrite(sprintf('treino%i.txt',i), T,' ');
    dlmwrite(sprintf('validacao%i.txt',i), V,' ');
    dlmwrite(sprintf('Etreino%i.txt',i), ET,' ');
    dlmwrite(sprintf('Evalicacao%i.txt',i), EV,' ');
    
end

