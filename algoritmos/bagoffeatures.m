

ims = imageDatastore('C:/Users/Leonardo/Google Drive/2_Semestre/Disserta��o/RGB_12/Italia/-2');



extractorFcn = @exampleBagOfFeaturesExtractor;
B = bagOfFeatures(ims);

H = encode(B,ims);
 
 