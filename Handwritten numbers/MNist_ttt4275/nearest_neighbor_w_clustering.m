load('data_all.mat');

for i = 1:10
    [idx(i),C(i)] = kmeans(trainv(),64);
end