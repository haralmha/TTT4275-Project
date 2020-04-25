x1all = load('class_1','-ascii');
x2all = load('class_2','-ascii');
x3all = load('class_3','-ascii');

numClasses = 3;
numFeatures = 4;
trainingSamples = 30;
testSamples = 50 - trainingSamples;


trainingData = zeros(numFeatures, 3*trainingSamples);
trainingLabels = zeros(numClasses, 3*trainingSamples);
for i = 1:trainingSamples
    trainingData(:,i) = x1all(i,:)';
    trainingData(:,trainingSamples+i) = x2all(i,:)';
    trainingData(:,2*trainingSamples+i) = x3all(i,:)';
    trainingLabels(:,i) = [1;0;0];
    trainingLabels(:,trainingSamples+i) = [0;1;0];
    trainingLabels(:,2*trainingSamples+i) = [0;0;1];
end

trainingLabels1 = [ones(1,trainingSamples),zeros(1,2*trainingSamples);
                   zeros(1,trainingSamples),ones(1,2*trainingSamples)];



weights = getPerceptronWeights(trainingData, trainingLabels1);