load('data_all.mat');

k = 7;
num_clusters = 64;
num_classes = 10;
dimensions = 28*28;
clusters = zeros(num_clusters*num_classes,dimensions);
cluster_labels = zeros(num_clusters*num_classes,1);
for i = 1:num_classes
    class_indeces = find(trainlab == i-1);
    class_vectors = trainv(class_indeces,:);
    [idx,C] = kmeans(class_vectors,num_clusters);
    clusters(((i-1)*num_clusters+1):(i*num_clusters),:) = C;
    cluster_labels(((i-1)*num_clusters+1):(i*num_clusters)) = i-1;
end
classified_testlab = k_nearest_neighbors(clusters,cluster_labels,testv,k);
confusion_matrix = zeros(10);

for i = 1:num_test
    confusion_matrix(testlab(i)+1,classified_testlab(i)+1) = confusion_matrix(testlab(i)+1,classified_testlab(i)+1) + 1;
end

for i = 1:10
    for j = 1:10
        fprintf("%i\t", confusion_matrix(i,j));
    end
    fprintf("\n");
end
correct = 0;
for i = 1:10
    correct = correct + confusion_matrix(i,i);
end
fprintf("Correct classifications = %i out of 10 000\n", correct);