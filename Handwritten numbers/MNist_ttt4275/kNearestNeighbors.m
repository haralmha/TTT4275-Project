function testSet = kNearestNeighbors(trainingSet, testSet, numClasses, k)
    dimTraining = length(trainingSet);
    dimTest = length(testSet);
    distances = zeros(1, dimTraining);
    classCount = zeros(1, numClasses);
    for i = 1:dimTest
        for j = 1:dimTraining
            distances(j).val = squaredEuclideanDistance(testSet(i).points, trainingSet(j).points);
            distances(j).class = trainingSet(j).class;
        end
        sort(distances);
        for c = 1:numClasses
            classCount(c) = length(find(distances(1:k).class == c));
        end
        testSet.class = find(max(classCount));
    end

end