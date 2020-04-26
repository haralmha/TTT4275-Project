x1all = load('class_1','-ascii');
x2all = load('class_2','-ascii');
x3all = load('class_3','-ascii');

numClasses = 3;
numFeatures = 4;
totSamples = 50;
trainingSamples = 30;
testSamples = totSamples - trainingSamples;

%Takes out the 30 first rows of the whole data set
trainingData = zeros(3*trainingSamples, numFeatures);
for i = 1:trainingSamples
    trainingData(i,:) = x1all(i,:);
    trainingData(trainingSamples+i,:) = x2all(i,:);
    trainingData(2*trainingSamples+i,:) = x3all(i,:);
end
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

trainingLabels1 = [ones(trainingSamples,1);zeros(2*trainingSamples,1)];
trainingLabels2 = [zeros(trainingSamples,1);ones(trainingSamples,1);zeros(trainingSamples,1)];
trainingLabels3 = [zeros(2*trainingSamples,1);ones(trainingSamples,1)];

weights1 = getPerceptronWeights(trainingData, trainingLabels1);
weights2 = getPerceptronWeights(trainingData, trainingLabels2);
weights3 = getPerceptronWeights(trainingData, trainingLabels3);

labels = perceptronClassification(weights1,weights2,weights3,testData);
correct = 0;
confusionMatrix = zeros(numClasses);
for i = 1:testSamples*numClasses
    if labels(i) == testLabels(i)
        correct = correct + 1;
    end
    confusionMatrix(testLabels(i),labels(i)) = confusionMatrix(testLabels(i),labels(i))+1;
end
fprintf("Confusion matrix:\n");
for i = 1:numClasses
    for j = 1:numClasses
        fprintf("%i\t", confusionMatrix(i,j));
    end
    fprintf("\n");
end
fprintf("Correct classifications = %d\n", correct);