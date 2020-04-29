# Project in TTT4275 - Estimation, detection and classification
This presents the work in our semester assignment in the course TTT4275 - Estimation, detection and classification. We chose the classification project which consisted of two independent parts; classification of the Iris flower and classification of handwritten numbers.

## Iris
In this task, we were supposed to classiy three different variants of the Iris flower named Setosa, Versicolor and Virginica, based on the length and width of their large (Sepal) and small (Petal) leaves. Since this data set is close to linearly separable, our exercise was to implement a linear classifier and observe its accuracy based on confusion matrices and error rates.

#### Files
* class_1, class_2, class_3 and iris.data are handed out files. Each row in the files represents one sample of the correspnding class with petal length, petal width, sepal length and sepal width. The iris.data file is basically class_1, class_2 and class_3 merged with the name of the Iris variant at the end of each line.
* getPerceptronWeights.m trains and returns the coefficients of a hyperplane weight matrix based on a training data set and corresponding class labels.
* perceptronClassification.m classifies a test set based on weight matrices of three hyperplanes.
* perceptronTest.m tests our multiclass perceptron classifier in several manners. Each variant of testing can be done by uncommenting its part.
* getMSE.m returns the Minimum Square Error of an array with classified points.
* gradMSE.m returns the gradient of the MSE with respect to the weight matrix.
* sigmoid.m returns the result of the sigmoid function.
* histo_G.m produces histograms of the four features.
* The histograms folder contains the histograms of the four features.
* .DS_Store, 00iris.readme, Klassene.jpeg and train_test_sg5.m are hand-outs from the project which are not used. However, train_test_sg5.m are somewhat used as an inspiration for our test file.

## Handwritten letters
The main goal of this task was to implement some variants of a k-nearest-neighbor classifier in order to classify some handwritten numbers 0-9 based on pixtures from the MNIST database. The pixtures are of dimension 28x28, with a 8-bit greyscale (a number between 0 and 255) in each pixel. We got handed out a training set of 60 000 pixtures written by 250 persons and a test set of 10 000 pixtures written by 250 other persons.

#### Files
* read09.m was handed out to run once, such that the necessary data in data_all.mat was accessible.
* test_knn.m allows one to test all the different ways of classifying; with or without clustering and with different choices of k. Represents the accuracy with a printed confusion matrix and error rate.
* cluster_data_set.m clusters the data set into a defined number of clusters with labels.
* k_nearest_neighbors.m classifies a test set based on the k-nearest-neighbors algorithm.
* nearest_neighbor_with_chunks.m behaves like k_nearest_neighbors.m for k=1 without clustering, but with one significant difference; it also splits up the template set into chunks, such that each chunk of 10 test sets are classified based on a chunk of 60 templates. This increases the computational speed, but reduces the accuracy from over 90 % to 60 %. Therefore we have not used this in our knn_test.m file.
* n_min_numbers.m returns the n smallest numbers in each column of a matrix.
* The plots folder contains plots from some arbitrary misclassified and correctly classified numbers. The file pick_and_plot_arbitrary_correct_and_wrong.m creates these plots.
