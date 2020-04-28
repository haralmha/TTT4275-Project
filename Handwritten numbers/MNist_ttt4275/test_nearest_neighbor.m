load('data_all.mat');

classified_testlab = nearest_neighbor2(trainv,trainlab,testv);

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