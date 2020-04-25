x1all = load('class_1','-ascii');
x2all = load('class_2','-ascii');
x3all = load('class_3','-ascii');

numClasses = 3;
numFeatures = 4;
totSamples = 50;
trainingSamples = 30;
testSamples = totSamples - trainingSamples;


trainingData = zeros(numFeatures, 3*trainingSamples);
for i = 1:trainingSamples
    trainingData(:,i) = x1all(i,:)';
    trainingData(:,trainingSamples+i) = x2all(i,:)';
    trainingData(:,2*trainingSamples+i) = x3all(i,:)';
end
testData = zeros(numFeatures, 3*testSamples);
testLabels = zeros(1, 3*testSamples);
for i = 1:testSamples
    testData(:,i) = x1all(trainingSamples+i,:)';
    testData(:,2*testSamples+i) = x2all(trainingSamples+i,:)';
    testData(:,3*testSamples+i) = x3all(trainingSamples+i,:)';
    testLabels(:,i) = 1;
    testLabels(:,testSamples+i) = 2;
    testLabels(:,2*testSamples+i) = 3;
end

trainingLabels1 = [ones(1,trainingSamples),zeros(1,2*trainingSamples)];
trainingLabels2 = [zeros(1,trainingSamples),ones(1,trainingSamples),zeros(1,trainingSamples)];
trainingLabels3 = [zeros(1,2*trainingSamples),ones(1,trainingSamples)];

weights1 = getPerceptronWeights(trainingData, trainingLabels1);
weights2 = getPerceptronWeights(trainingData, trainingLabels2);
weights3 = getPerceptronWeights(trainingData, trainingLabels3);

labels = perceptronClassification(weights1,weights2,weights3,testData);
correct = 0;
for i = 1:testSamples
    if labels(:,i) == testLabels(:,i)
        correct = correct + 1;
    end
end
fprintf("Correct classifications = %d\n", correct);