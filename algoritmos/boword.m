A1=imread('arvore1.png');
A2=imread('arvore2.png');
A3=imread('arvore3.png');
C1=imread('carros1.png');
C2=imread('carros2.png');
C3=imread('carros3.png');
P1=imread('pessoas1.png');
P2=imread('pessoas2.png');
P3=imread('pessoas3.png');

SA1 = detectSURFFeatures(A1,'MetricThreshold',1000);
SA2 = detectSURFFeatures(A2,'MetricThreshold',1000);
SA3 = detectSURFFeatures(A3,'MetricThreshold',1000);
SC1 = detectSURFFeatures(C1,'MetricThreshold',1000);
SC2 = detectSURFFeatures(C2,'MetricThreshold',1000);
SC3 = detectSURFFeatures(C3,'MetricThreshold',1000);
SP1 = detectSURFFeatures(P1,'MetricThreshold',1000);
SP2 = detectSURFFeatures(P2,'MetricThreshold',1000);
SP3 = detectSURFFeatures(P3,'MetricThreshold',1000);

FA1 = extractFeatures(A1,SA1);
FA2 = extractFeatures(A2,SA2);
FA3 = extractFeatures(A3,SA3);

FC1 = extractFeatures(C1,SC1);
FC2 = extractFeatures(C2,SC2);
FC3 = extractFeatures(C3,SC3);

FP1 = extractFeatures(P1,SP1);
FP2 = extractFeatures(P2,SP2);
FP3 = extractFeatures(P3,SP3);

F=[FA1(1:500,:); FA2(1:500,:); FA3(1:500,:); FC1(1:500,:); FC2(1:500,:); FC3(1:500,:); FP1(1:500,:); FP2(1:500,:); FP3(1:500,:)];

B=10;

[id, centers] = kmeans(double(F), B);

H=zeros(9,B);

for i=1:4500
    k=ceil(i/500);
    H(k,id(i))=H(k,id(i))+1;
end

for i=1:9
    H(i,:)=H(i,:)/sum(H(i,:));
end

