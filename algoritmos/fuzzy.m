clear all;
close all;
vitoria = load('Vitoria.txt');
redglobe = load('RedGlobe.txt');
italia = load('Italia.txt');

pt = 0.8;
pv = 1-pt;

tvitoria = load('Textura_Vitoria.txt');
tredglobe = load('Textura_RedeGlobe.txt');
titalia = load('Textura_Italia.txt');

rdados = [vitoria; redglobe; italia];
tdados = [tvitoria; tredglobe; titalia];

dadost = [rdados(:,1:4) tdados];
%mdados = [mean(dadost(:,1:end-2)) tdados(:,end-1:end)];
dados =  redglobe;
[m, n] = size(dados);

idc = randperm(m); % Permutação 
dados = dados(idc,:); % Dados de entrada

trnData = dados(1:m*pt,1:n-2);
outData = dados(1:m*pt,n-1);

%Criação de dados de entrada e daida para validação
chkData = dados(m*pt+1:end,1:n-2);
OutChk = dados(m*pt+1:end,n-1);


numMFs =3;
mfType = 'gaussmf';

inFis = genfis1([trnData outData], numMFs, mfType);
nepocas = 1000;
tegoal = 0;
iss = 0.1;
ssd = 0.09;
ssi = 0.11;

trnOpt = [nepocas tegoal iss ssd ssi]; 

dispOpt = [1 1 1 1];  


[toutFis terror step coutFis cerror] = anfis([trnData outData],inFis,trnOpt,dispOpt,[chkData OutChk]);

z_hat = evalfis(trnData, toutFis)';
z_hac = evalfis(chkData, coutFis)';

%Erro médio quadratico
RMSEc1 = sqrt(mean((z_hat - outData').^2));
RMSEv1 = sqrt(mean((z_hac - OutChk').^2));

%RMSEc2 = sqrt(mean((z_hat(2,:) - outData(2,:)).^2));
%RMSEv2 = sqrt(mean((z_hac(2,:) - OutChk(2,:)).^2));

z_hac = round(z_hac);

aa = zeros(max(z_hac),length(OutChk'));
bb = zeros(max(z_hac),length(OutChk'));

for col = 1:length(OutChk')
    
    aa(OutChk(col,1),col) = 1;
    if z_hac(1,col) <= 0
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



MM = confusionmat(z_hac,OutChk');
%MM1 = confusionmat(z_hac(2,:),OutChk(2,:));

FP = sum(MM)' - diag(MM);
FN = sum(MM,2) - diag(MM);

TP = diag(MM);
TN = sum(diag(MM)) - diag(MM);

ext = 100*(TP + TN)./(TP + FN + FP + TN);

sen = 100*TP./(TP + FN); 

tfp = 100*FP./(FP + TN);

sel = 100*TN./(FP + TN);



ac = 100*(TP + TN)/length(OutChk');

esp = 100*TN./(TN + FP);

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
