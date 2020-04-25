function labels = perceptronClassification(weights1, weights2, weights3, testData)
    testSamples = size(testData,2);
    labels = zeros(3,testSamples);
    g = zeros(2,3);
    for i = 1:testSamples
        g(:,1) = weights1(:,1:end-1)*testData(:,i) + weights1(:,end);
        g(:,2) = weights2(:,1:end-1)*testData(:,i) + weights2(:,end);
        g(:,3) = weights3(:,1:end-1)*testData(:,i) + weights3(:,end);        
        if g(1,1) > g(1,2) && g(1,1) > g(1,3)
            labels(1,i) = 1;
        elseif g(1,2) >= g(1,1) && g(1,2) >= g(1,3)
            labels(2,i) = 1;
        else
            labels(3,i) = 1;
        end
    end
end