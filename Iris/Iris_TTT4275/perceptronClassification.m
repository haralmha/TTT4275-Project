function labels = perceptronClassification(weights1, weights2, weights3, testData)
    testSamples = size(testData,2);
    labels = zeros(1,testSamples);
    g = zeros(1,3);
    for i = 1:testSamples
        g(:,1) = weights1(:,1:end-1)*testData(:,i) + weights1(:,end);
        g(:,2) = weights2(:,1:end-1)*testData(:,i) + weights2(:,end);
        g(:,3) = weights3(:,1:end-1)*testData(:,i) + weights3(:,end);
        labels(1,i) = (find([g(:,1),g(:,2),g(:,3)] == max([g(:,1),g(:,2),g(:,3)])));
    end
end