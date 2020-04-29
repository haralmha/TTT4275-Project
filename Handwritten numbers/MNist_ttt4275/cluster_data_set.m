function [clusters,cluster_labels] = cluster_data_set(num_clusters,num_classes,data_set,labels)
    dimensions = size(data_set,2);
    clusters = zeros(num_clusters*num_classes,dimensions);
    cluster_labels = zeros(num_clusters*num_classes,1);
    for i = 1:num_classes
        class_indeces = find(labels == i-1);
        class_vectors = data_set(class_indeces,:);
        [~,C] = kmeans(class_vectors,num_clusters);
        clusters(((i-1)*num_clusters+1):(i*num_clusters),:) = C;
        cluster_labels(((i-1)*num_clusters+1):(i*num_clusters)) = i-1;
    end
end