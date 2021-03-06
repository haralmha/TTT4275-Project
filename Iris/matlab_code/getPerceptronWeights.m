function [mse_vec, W] = getPerceptronWeights(trainingData, trainingLabels)
    numFeatures = size(trainingData,2);
    alpha = 0.01; % "Learning rate". How much change applied to W for each iteration
    maxIter = 10000;
    W = zeros(1, numFeatures+1); % W = [W, w_o]
    x = [(trainingData');ones(1,size(trainingData,1))]; % x = [x',1]' (see 3.2 in compendium)
    g = sigmoid(W,x); % 0 < g < 1
    iter = 0;
    epsilon = 0.01; % Error threshold to break the loop if mse converges
    mse = getMSE(g, trainingLabels'); % Minimum square error
    mse_vec(iter + 1) = mse;
    while iter < maxIter && mse > epsilon
        W = W - alpha*gradMSE(g, trainingLabels', x); % Update weight matrix W
        g = sigmoid(W,x);
        iter = iter + 1;
        mse = getMSE(g, trainingLabels');
        mse_vec(iter + 1) = mse; 
    end
    if iter >= maxIter
        fprintf("Maximum number of iterations reached.\n");
    else
        fprintf("MSE converged.\n");
    end
    fprintf("MSE = %d\nNumber of iterations = %i\n", mse,iter);
end