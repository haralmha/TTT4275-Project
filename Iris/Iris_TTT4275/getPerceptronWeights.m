function W = getPerceptronWeights(trainingData, trainingLabels)
    numFeatures = size(trainingData,1);
    alpha = 1;
    maxIter = 10000;
    W = zeros(2, numFeatures+1); % W = [W, w_o]
    g = W*[trainingData;ones(1,size(trainingData,2))];
    iter = 0;
    epsilon = 0.01;
    mse = getMSE(g, trainingLabels);
    while iter < maxIter && mse > epsilon
        W = W - alpha*gradMSE(g, trainingLabels, [trainingData;ones(1,size(trainingData,2))]);
        g = W*[trainingData;ones(1,size(trainingData,2))];
        iter = iter + 1;
        mse = getMSE(g, trainingLabels);
    end
    if iter >= maxIter
        fprintf("Maximum number of iterations reached.\n");
        fprintf("MSE = %d\n", mse);
    else
        fprintf("MSE converged.\n");
    end
end