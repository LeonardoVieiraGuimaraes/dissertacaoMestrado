clear all;
close all;
vitoria = load('Vitoria.txt');
redglobe = load('RedGlobe.txt');
italia = load('Italia.txt');

pt = 0.5;
pv = 1-pt;

tvitoria = load('Textura_Vitoria.txt');
tredglobe = load('Textura_RedeGlobe.txt');
titalia = load('Textura_Italia.txt');

rdados = [vitoria; redglobe; italia];
tdados = [tvitoria; tredglobe; titalia];

dadost = [rdados(:,1:4) tdados];
dados =  tdados;
[m, n] = size(dados);

for i = 1:m
    dados(i,1:n-2) = (dados(i,1:n-2) - mean(dados(:,1:n-2)))./std(dados(:,1:n-2));
end

idc = randperm(m); % Permutação 
dados = dados(idc,:); % Dados de entrada

trnData = dados(1:m*pt,1:n-2)';
outData = dados(1:m*pt,n)';

%Criação de dados de entrada e daida para validação
chkData = dados(m*pt+1:end,1:n-2)';
OutChk = dados(m*pt+1:end,n)';

%configuração e configuração da Rede MLP 
trainFcn = 'traingdx';
net = feedforwardnet(100);

net.trainParam.epochs = 3000;
net.trainParam.goal = 0;
%net.trainParam.mc = 0.9;
net.trainParam.max_fail = 100000;
%net.trainParam.max_perf_inc = 1.04
%net.trainParam.min_grad
%net.trainParam.show = 25
net.trainParam.lr = 0.1;
%net.divideParam.trainRatio= 1; % we use 70% of the data for training 
%net.divideParam.valRatio= 0; % 30% is for validation
%net.divideParam.testRatio= 0; % 0% for testing



[net,tr] = train(net,trnData',outData');
z_hat = net(trnData);
z_hac = net(chkData);





%Erro médio quadratico
RMSEc1 = sqrt(mean((z_hat(1,:) - outData(1,:)).^2));
RMSEv1 = sqrt(mean((z_hac(1,:) - OutChk(1,:)).^2));

%RMSEc2 = sqrt(mean((z_hat(2,:) - outData(2,:)).^2));
%RMSEv2 = sqrt(mean((z_hac(2,:) - OutChk(2,:)).^2));

z_hac = round(z_hac);

aa = zeros(max(z_hac(1,:)),length(OutChk(1,:)));
bb = zeros(max(z_hac(1,:)),length(OutChk(1,:)));

for col = 1:length(OutChk(1,:))
    aa(OutChk(1,col),col) = 1;
    if z_hac(1,col) == 0
        z_hac(1,col) = 1;
    end
    bb(z_hac(1,col),col) = 1;
end


[tpr fpr the] = roc(aa,bb);
figure
plotroc(aa,bb);

  
%ro = roc(bb,aa);
%figure
%plotroc(bb',aa')
%title('tempo')
%figure
%plotroc(OutChk(2,:),z_hac(2,:))
%title('variadede')
%I = OutChk(2,:);

%ro = roc(OutChk(2,:),z_hac(2,:));



MM = confusionmat(z_hac(1,:),OutChk(1,:));
%MM1 = confusionmat(z_hac(2,:),OutChk(2,:));

FP = sum(MM)' - diag(MM);
FN = sum(MM,2) - diag(MM);

TP = diag(MM);
TN = sum(diag(MM)) - diag(MM);

ext = 100*(TP + TN)./(TP + FN + FP + TN);

sen = 100*TP./(TP + FN); 

tfp = 100*FP./(FP + TN);

sel = 100*TN./(FP + TN);



ac = 100*(TP + TN)/length(OutChk);

esp21 = 100*TN./(TN + FP);

ef = (sen + esp)./2;

%FP1 = sum(MM1)' - diag(MM1);
%FN1 = sum(MM1,2) - diag(MM1);

%TP1 = diag(MM1);
%TN1 = sum(diag(MM1)) - diag(MM1);

%ext1 = 100*(TP1 + TN1)./(TP1 + FN1 + FP1 + TN1);

%sen1 = 100*TP1./(TP1 + FN1); 

%tfp1 = 100*FP1./(FP1 + TN1);

%sel1 = 100*TN1./(FP1 + TN1);

%ac1 = 100*(TP1 + TN1)/length(OutChk);

%esp1 = 100*TN1./(TN1 + FP1);

%ef1 = (sen1 + esp1)./2;
