x1all = load('class_1','-ascii');
x2all = load('class_2','-ascii');
x3all = load('class_3','-ascii');

numClasses = 3;
numFeatures = 4;
totSamples = 50;
trainingSamples = 30;
testSamples = totSamples - trainingSamples;

%% Use this for training and testing with all features
% fprintf('Training and testing using all features\n')
% trainingData = zeros(3*trainingSamples, numFeatures);
% trainingLabels = zeros(3*trainingSamples,1);
% testData = zeros(3*testSamples, numFeatures);
% testLabels = zeros(3*testSamples,1);

%% Use this for training and testing with 3 features (1,3,4)
% fprintf('Training and testing using feature 1,3,4\n')
% x1all = [x1all(:,1) x1all(:,3) x1all(:,4)];
% x2all = [x2all(:,1) x2all(:,3) x2all(:,4)];
% x3all = [x3all(:,1) x3all(:,3) x3all(:,4)];
% trainingData = zeros(3*trainingSamples, numFeatures-1);
% trainingLabels = zeros(3*trainingSamples,1);
% testData = zeros(3*testSamples, numFeatures-1);
% testLabels = zeros(3*testSamples,1);

%% Use this for training and testing with 2 features (3,4)
% fprintf('Training and testing using feature 3,4\n')
% x1all = [x1all(:,3) x1all(:,4)];
% x2all = [x2all(:,3) x2all(:,4)];
% x3all = [x3all(:,3) x3all(:,4)];
% trainingData = zeros(3*trainingSamples, numFeatures-2);
% trainingLabels = zeros(3*trainingSamples,1);
% testData = zeros(3*testSamples, numFeatures-2);
% testLabels = zeros(3*testSamples,1);

%% Use this for training and testing with 1 feature (3)
fprintf('Training and testing using feature 3\n')
x1all = [x1all(:,3)];
x2all = [x2all(:,3)];
x3all = [x3all(:,3)];
trainingData = zeros(3*trainingSamples, numFeatures-3);
trainingLabels = zeros(3*trainingSamples,1);
testData = zeros(3*testSamples, numFeatures-3);
testLabels = zeros(3*testSamples,1);

%% Training and testing
for k = 1:1
    
    if k == 1
        fprintf('30 first for training, 20 last for testing\n');
        % Extracts the 30 first rows of the data set into the training set
        for i = 1:trainingSamples
            trainingData(i,:) = x1all(i,:);
            trainingData(trainingSamples+i,:) = x2all(i,:);
            trainingData(2*trainingSamples+i,:) = x3all(i,:);
            trainingLabels(i) = 1;
            trainingLabels(trainingSamples+i) = 2;
            trainingLabels(2*trainingSamples+i) = 3;
        end
        % Extracts the 20 last rows of the data set into the test set
        for i = 1:testSamples
            testData(i,:) = x1all(trainingSamples+i,:);
            testData(testSamples+i,:) = x2all(trainingSamples+i,:);
            testData(2*testSamples+i,:) = x3all(trainingSamples+i,:);
            testLabels(i) = 1;
            testLabels(testSamples+i) = 2;
            testLabels(2*testSamples+i) = 3;
        end
    elseif k == 2
        fprintf('\n\n30 last for training, 20 first for testing\n');
        % Extracts the 30 last rows of the data set into the training set
        for i = 1:trainingSamples
            trainingData(i,:) = x1all(testSamples+i,:);
            trainingData(trainingSamples+i,:) = x2all(testSamples+i,:);
            trainingData(2*trainingSamples+i,:) = x3all(testSamples+i,:);
            trainingLabels(i) = 1;
            trainingLabels(trainingSamples+i) = 2;
            trainingLabels(2*trainingSamples+i) = 3;
        end
        % Extracts the 20 first rows of the data set into the test set
        for i = 1:testSamples
            testData(i,:) = x1all(i,:);
            testData(testSamples+i,:) = x2all(i,:);
            testData(2*testSamples+i,:) = x3all(i,:);
            testLabels(i) = 1;
            testLabels(testSamples+i) = 2;
            testLabels(2*testSamples+i) = 3;
        end
    end
        

    % Three labels to use for the "one vs all" approach
    trainingLabels1 = [ones(trainingSamples,1);zeros(2*trainingSamples,1)];
    trainingLabels2 = [zeros(trainingSamples,1);ones(trainingSamples,1);zeros(trainingSamples,1)];
    trainingLabels3 = [zeros(2*trainingSamples,1);ones(trainingSamples,1)];

    % The weights consists of coefficients for three hyperplanes for separating
    % one class from the rest (weights1 separates class 1 from the two others,
    % weights2 separates class 2, and weights 3 separates class 3).
    [mse_vec1,weights1] = getPerceptronWeights(trainingData, trainingLabels1);
    [mse_vec2,weights2] = getPerceptronWeights(trainingData, trainingLabels2);
    [mse_vec3,weights3] = getPerceptronWeights(trainingData, trainingLabels3);

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

end