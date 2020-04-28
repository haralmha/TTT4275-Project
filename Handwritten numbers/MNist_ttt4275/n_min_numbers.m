function numbers = n_min_numbers(matrix, n)
    numbers = matrix(1:n);
    for i = n+1:size(matrix,1)
        max_num = max(numbers);
        if matrix(i) < max_num
            %numbers(find(max_num == numbers)) = matrix(i);
            for j = 1:n
                if numbers(j) == max_num
                    numbers(j) = matrix(i);
                    break;
                end
            end
        end
    end
end