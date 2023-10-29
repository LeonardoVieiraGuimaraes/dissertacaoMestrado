clear all;

pt = 0.8;
pv = 1-pt;

%titalia = load('Textura_Italia3.txt');
%tredglobe = load('Textura_RedBlobe3.txt');
tvitoria = load('Textura_Vitoria.txt');

dados = tvitoria;

[m, n] = size(dados);

idc = randperm(m); % Permutação 
dados = dados(idc,:); % Dados de entrada


trnData = dados(1:m*pt,1:n-2);
outData = dados(1:m*pt,n-1);

%Criação de dados de entrada e daida para validação
chkData = dados(m*pt+1:end,1:n-2);
OutChk = dados(m*pt+1:end,n-1);

%m = knn(chkData,trnData,outData);
%templ = templateTree('Surrogate','all');
ens = fitcensemble(trnData,outData,'Method','AdaBoostM2');
m = predict(ens,chkData);
MM = confusionmat(m(:,1),OutChk(:,1));

FP = sum(MM)' - diag(MM);
FN = sum(MM,2) - diag(MM);

TP = diag(MM);
TN = sum(diag(MM)) - diag(MM);

ext = 100*(TP + TN)./(TP + FN + FP + TN);

sen = 100*TP./(TP + FN); 

tfp = 100*FP./(FP + TN);

sel = 100*TN./(FP + TN);



ac = 100*(TP + TN)/length(OutChk);

esp = 100*TN./(TN + FP);

ef = (sen + esp)./2;