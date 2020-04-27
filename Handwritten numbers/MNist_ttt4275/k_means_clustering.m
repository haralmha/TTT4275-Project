function clusters = k_means_clustering(train_vectors, train_labels, num_clusters)
    num_features = size(train_vectors, 2);
    num_samples = size(train_vectors, 1);
    clusters = zeros(num_clusters,num_features);
    for i = 1:num_clusters
        for j = 1:num_features
            clusters(i,j) = randi(256) - 1;
        end
    end
    distances = dist(clusters,train_vectors);
    for i = 1:num_samples
        for j = 1:clusters
            
        end
    end
end