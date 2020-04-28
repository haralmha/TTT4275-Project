function clusters = k_means_clustering(train_vectors, train_labels, num_clusters)
    num_features = size(train_vectors, 2);
    num_samples = size(train_vectors, 1);
    clusters = zeros(num_features,num_clusters);
    for i = 1:num_features
        for j = 1:num_clusters
            clusters(i,j) = randi(256) - 1;
        end
    end
    distances = zeros(num_clusters,num_features);
    for i = 1:num_samples
        distances(:,i) = dist(clusters,(train_vectors(i,:)));
    end
end