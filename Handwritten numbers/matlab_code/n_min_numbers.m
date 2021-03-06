function numbers = n_min_numbers(matrix, n)
    columns = size(matrix,2);
    numbers = zeros(n,columns);
    for j = 1:columns
        numbers(:,j) = matrix(1:n,j);
        for i = n+1:size(matrix,1)
            max_num = max(numbers(:,j));
            if matrix(i,j) < max_num
                %numbers(find(max_num == numbers)) = matrix(i);
                for k = 1:n
                    if numbers(k,j) == max_num
                        numbers(k,j) = matrix(i,j);
                        break;
                    end
                end
            end
        end
    end
end