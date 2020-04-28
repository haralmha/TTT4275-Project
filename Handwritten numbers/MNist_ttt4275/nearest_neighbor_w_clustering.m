load('data_all.mat');

num_clusters = 64;

for i = 1:10
    class_indeces = find(trainlab == i-1);
    class_vectors = trainv(class_indeces,:);
    [idx(i),C(i)] = kmeans(trainv(),num_clusters);
end