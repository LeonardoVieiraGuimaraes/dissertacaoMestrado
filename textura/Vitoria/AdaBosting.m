function ens = AdaBosting(X,Y)
    templ = templateTree('Surrogate','all');
    ens = fitcensemble(X,Y,'Method','AdaBoostM2','NumLearningCycles',50,'Learners',templ);

end
