load('data_all.mat');

% use_clustering is a boolean value that clusters the data set into num_clusters different
% clusters if true. Uses the original dataset if false
use_clustering = true;

% k indicates how many of the nearest neighbors one should extract in order
% to classify using the k-nearest-neighbors method
k = 7;

% Number of classes (0-9 in this exercise)
num_classes = 10;

if use_clustering
    num_clusters = 64;
    [data_set,data_labels] = cluster_data_set(num_clusters,num_classes,trainv,trainlab);
else
    data_set = trainv;
    data_labels = trainlab;
end

% k_nearest_neighbors returns the 1x10000 vector classified_testlab that indicates
% which class each vector in testv got assigned
classified_testlab = k_nearest_neighbors(data_set,data_labels,testv,k);

% Creates the confusion matrix by comparing classified_testlab to the
% correct ones in testlab
confusion_matrix = zeros(num_classes);
for i = 1:num_test
    confusion_matrix(testlab(i)+1,classified_testlab(i)+1) = confusion_matrix(testlab(i)+1,classified_testlab(i)+1) + 1;
end

% Prints out the confusion matrix and the number of correctly classified
% elements
for i = 1:num_classes
    for j = 1:num_classes
        fprintf("%i\t", confusion_matrix(i,j));
    end
    fprintf("\n");
end
correct = 0;
for i = 1:num_classes
    correct = correct + confusion_matrix(i,i);
end
fprintf("Correct classifications = %i out of %i\n", correct, size(testlab,1));