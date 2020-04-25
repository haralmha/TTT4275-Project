function W = getPerceptronWeights(trainingData, trainingLabels)
    numFeatures = size(trainingData,1);
    alpha = 0.01;
    maxIter = 10000;
    W = zeros(2, numFeatures+1); % W = [W, w_o]
    x = [trainingData;ones(1,size(trainingData,2))];
    g = sigmoid(W,x);
    iter = 0;
    epsilon = 0.01;
    mse = getMSE(g, trainingLabels);
    while iter < maxIter && mse > epsilon
        W = W - alpha*gradMSE(g, trainingLabels, x);
        g = sigmoid(W,x);
        iter = iter + 1;
        mse = getMSE(g, trainingLabels);
    end
    if iter >= maxIter
        fprintf("Maximum number of iterations reached.\n");
    else
        fprintf("MSE converged.\n");
    end
    fprintf("MSE = %d\nNumber of iterations = %i\n", mse,iter);
end