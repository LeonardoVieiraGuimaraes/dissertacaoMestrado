function [features, featureMetrics, varargout] = exampleBagOfFeaturesExtractor3(I)
% This function implements the default SURF feature extraction used in
% bagOfFeatures and is only intended to show how to write a custom 
% extractor function for bagOfFeatures.
%
% [features, featureMetrics] = exampleBagOfFeaturesExtractor(I) returns
% SURF features extracted over a regular grid of point locations at
% multiple scales.
%
% [..., featureLocations] = exampleBagOfFeaturesExtractor(I) optionally
% return the feature locations. This is used by the indexImages function
% for creating a searchable image index.
%
% Example - Using custom features in bagOfFeatures
% ------------------------------------------------
% % Define a set of images
% setDir = fullfile(toolboxdir('vision'),'visiondata','imageSets');
% imgDs = imageDatastore(setDir, 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
% 
% % Specify a custom extractor function
% extractor = @exampleBagOfFeaturesExtractor;
% customBag = bagOfFeatures(imgDs, 'CustomExtractor', extractor)
%
% See also bagOfFeatures, retrieveImages, indexImages
 
%% Step 1: Preprocess the Image
% The extractor function is applied to each image, I, within the image set
% used to create the bagOfFeatures. Depending on the type of features being
% extracted, the input images may require preprocessing prior to feature
% extraction. For SURF features, I must be a grayscale image.
% Convert I to grayscale if required.
[height,width,numChannels] = size(I);
if numChannels > 1
    grayImage = rgb2gray(I);
else
    grayImage = I;
end

%% Step 2: Select Point Locations for Feature Extraction
% Here, a regular spaced grid of point locations is created over I. This
% allows for dense SURF feature extraction. 

% Define a regular grid over I.
gridStep = 9; % in pixels
gridX = 1:gridStep:width;
gridY = 1:gridStep:height;

[x,y] = meshgrid(gridX, gridY);

gridLocations = [x(:) y(:)];

%%
% Concatenate multiple SURFPoint objects at different scales to achieve
% multiscale feature extraction.
%multiscaleGridPoints = extractLBPFeatures(grayImage, 'ROI',gridLocations);
                    
% Alternatively, you may use a feature detector such as detectSURFFeatures
% or detectMSERFeatures to select point locations. For instance:
%
% multiscaleSURFPoints = detectSURFFeatures(grayImage);
numNeighbors = 8;
numBins = numNeighbors + 2;
lbpFeatures1 = extractLBPFeatures(grayImage, 'CellSize',[9 9],'NumNeighbors',numNeighbors,'Radius',1,'Upright',false);
n = length(lbpFeatures1)/numBins;
lbpCellHists1 = reshape(lbpFeatures1,n,numBins);

lbpFeatures2 =  extractLBPFeatures(grayImage, 'CellSize',[9 9],'NumNeighbors',numNeighbors,'Radius',2,'Upright',false);
n = length(lbpFeatures1)/numBins;
lbpCellHists2 = reshape(lbpFeatures2,n,numBins);

lbpFeatures3 =  extractLBPFeatures(grayImage, 'CellSize',[9 9],'NumNeighbors',numNeighbors,'Radius',3,'Upright',false);  
n = length(lbpFeatures1)/numBins;
lbpCellHists3 = reshape(lbpFeatures3,n,numBins);


%% Step 3: Extract features
% Finally, extract features from the selected point locations. By default,
% bagOfFeatures extracts upright SURF features. 
features = [lbpCellHists1;
    lbpCellHists2;
    lbpCellHists3];

%% Step 4: Compute the Feature Metric
% The feature metrics indicate the strength of each feature, where larger
% metric values are given to stronger features. The feature metrics are
% used to remove weak features before bagOfFeatures learns a visual
% vocabulary. You may use any metric that is suitable for your feature
% vectors.
%
% Use the variance of the SURF features as the feature metric.
featureMetrics = var(features,[],2);

% Alternatively, if a feature detector was used for point selection,
% the detection metric can be used. For example:
%
% featureMetrics = multiscaleSURFPoints.Metric;

% Optionally return the feature location information. The feature location
% information is used for image search applications. See the retrieveImages
% and indexImages functions.
if nargout > 2
    % Return feature location information
    varargout{1} = multiscaleGridPoints.Location;
end


