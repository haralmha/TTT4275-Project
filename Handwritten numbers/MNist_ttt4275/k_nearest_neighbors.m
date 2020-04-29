function test_labels = k_nearest_neighbors(template_vectors, template_labels, test_vectors, k)
    num_templates = size(template_vectors,1);
    num_tests = size(test_vectors,1);
    num_chunks = 1000;
    test_chunk_size = num_tests/num_chunks;
    test_labels = zeros(num_tests,1);
    for chunk_index = 1:num_chunks
        test_chunk = test_vectors(((chunk_index-1)*test_chunk_size+1):(chunk_index*test_chunk_size),:);
        distances = dist(template_vectors,test_chunk');
        min_dist_indeces = find(min(distances) == distances);
        for i = 1:test_chunk_size
            test_labels((chunk_index-1)*test_chunk_size+i) = template_labels(min_dist_indeces(i)-(i-1)*num_templates);
        end
    end

end