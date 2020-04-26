x1all = load('class_1','-ascii');
x2all = load('class_2','-ascii');
x3all = load('class_3','-ascii');

numClasses = 3;
numFeatures = 4;
totSamples = 50;
trainingSamples = 30;
testSamples = totSamples - trainingSamples;

% Extracts the 30 first rows of the data set
trainingData = zeros(3*trainingSamples, numFeatures);
trainingLabels = zeros(3*trainingSamples,1);
for i = 1:trainingSamples
    trainingData(i,:) = x1all(i,:);
    trainingData(trainingSamples+i,:) = x2all(i,:);
    trainingData(2*trainingSamples+i,:) = x3all(i,:);
    trainingLabels(i) = 1;
    trainingLabels(trainingSamples+i) = 2;
    trainingLabels(2*trainingSamples+i) = 3;
end

% Extracts the 20 last rows of the data set
testData = zeros(3*testSamples, numFeatures);
testLabels = zeros(3*testSamples,1);
for i = 1:testSamples
    testData(i,:) = x1all(trainingSamples+i,:);
    testData(testSamples+i,:) = x2all(trainingSamples+i,:);
    testData(2*testSamples+i,:) = x3all(trainingSamples+i,:);
    testLabels(i) = 1;
    testLabels(testSamples+i) = 2;
    testLabels(2*testSamples+i) = 3;
end

% Three labels to use for the "one vs all" approach
trainingLabels1 = [ones(trainingSamples,1);zeros(2*trainingSamples,1)];
trainingLabels2 = [zeros(trainingSamples,1);ones(trainingSamples,1);zeros(trainingSamples,1)];
trainingLabels3 = [zeros(2*trainingSamples,1);ones(trainingSamples,1)];

% The weights consists of coefficients for three hyperplanes for separating
% one class from the rest (weights1 separates class 1 from the two others,
% weights2 separates class 2, and weights 3 separates class 3).
weights1 = getPerceptronWeights(trainingData, trainingLabels1);
weights2 = getPerceptronWeights(trainingData, trainingLabels2);
weights3 = getPerceptronWeights(trainingData, trainingLabels3);

% Classifies the test set based on the features of each test sample and
% the weight coefficients for the three hyperplanes.
classifiedTestLabels = perceptronClassification(weights1,weights2,weights3,testData);
% Classifies the training set based on the features of each training sample and
% the weight coefficients for the three hyperplanes.
classifiedTrainingLabels = perceptronClassification(weights1,weights2,weights3,trainingData);


testConfusionMatrix = zeros(numClasses);
for i = 1:testSamples*numClasses
    testConfusionMatrix(testLabels(i),classifiedTestLabels(i)) = testConfusionMatrix(testLabels(i),classifiedTestLabels(i))+1;
end
trainingConfusionMatrix = zeros(numClasses);
for i = 1:trainingSamples*numClasses
    trainingConfusionMatrix(trainingLabels(i),classifiedTrainingLabels(i)) = trainingConfusionMatrix(trainingLabels(i),classifiedTrainingLabels(i))+1;
end
fprintf("Confusion matrix for test set:\n");
for i = 1:numClasses
    for j = 1:numClasses
        fprintf("%i\t", testConfusionMatrix(i,j));
    end
    fprintf("\n");
end
fprintf("Confusion matrix for training set:\n");
for i = 1:numClasses
    for j = 1:numClasses
        fprintf("%i\t", trainingConfusionMatrix(i,j));
    end
    fprintf("\n");
end
