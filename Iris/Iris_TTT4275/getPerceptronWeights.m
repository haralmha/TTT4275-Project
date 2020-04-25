function weightMatrix = getPerceptronWeights(trainingData, trainingLabels)
    N = size(trainingData,2);
    numFeatures = size(trainingData,1);
    numClasses = size(trainingLabels, 1);
    alpha = 0.01;
    maxIter = 10000;
    weightMatrix = zeros(numClasses, numFeatures+1); % W = [W, w_o]
    iter = 0;
    epsilon = 0.001;
    mse = getMSE(weightMatrix*trainingData, trainingLabels);
    while iter < maxIter || mse > epsilon
        weightMatrix = weightMatrix - alpha*gradMSE(weightMatrix*trainingData, trainingLabels, trainingData);
        iter = iter + 1;
        mse = getMSE(weightMatrix*trainingData, trainingLabels);
    end
end