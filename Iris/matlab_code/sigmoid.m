function g = sigmoid(weightMatrix,x)
    z = -weightMatrix*x;
    g = zeros(size(weightMatrix,1),size(x,2));
    for i = 1:size(g,1)
        for j = 1:size(g,2)
            g(i,j) = 1/(1+exp(z(i,j)));
        end
    end
end