% Loads all the data into the workspace
load('data_all.mat')

% We were recommended to split up the data sets into chunks
chunk_size = 1000;
num_train_chunks = num_train/chunk_size;

for i = 1:num_train_chunks
    
end