%F = load('C:\Users\Leonardo\Google Drive\2_Semestre\Dissertação\RGB_12\Italia\italialbp.txt');

[m, n] = size(H);
idc = randperm(m); % Permutação 
H = H(idc,:); % Dados de entrada

train = H(1:end-20,1:end-1);
grupo = H(1:end-20,end);

test = H(end-19:end,1:end-1);
out =  H(end-19:end,end);





ens = fitcensemble(train,grupo,'Method','AdaBoostM2');
m = predict(ens,test);
%m = classify(test,train,grupo,'diagLinear');
MM = confusionmat(m(:,1),out(:,1));

[x,y,z] = roc(m,out);


FP = sum(MM)' - diag(MM);
FN = sum(MM,2) - diag(MM);

TP = diag(MM);
TN = sum(diag(MM)) - diag(MM);

ac = 100*(TP + TN)/length(out);