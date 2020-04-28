load('data_all.mat');

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
classified_testlab = nearest_neighbor_cluster(clusters,cluster_labels,testv);