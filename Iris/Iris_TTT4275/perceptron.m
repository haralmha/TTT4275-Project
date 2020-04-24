function weights = perceptron(trainingSet)
    learningRate = 0.01;
    maxIter = 10000;
    weights = zeros(1, 2);
    iter = 0;
    while iter < maxIter
        randIndex = randi(size(trainingSet, 1));
        if trainingSet(randIndex, 2)*weights(1)*trainingSet(randIndex, 1)+weights(2) <= 0
            weights(1) = weights(1) + learningRate*trainingSet(randIndex, 1)*trainingSet(randIndex, 2);
            weights(2) = weights(2) + learningRate*trainingSet(randIndex, 2);
        end
        iter = iter + 1;
    end
end