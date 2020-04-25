function g = sigmoid(x, weightMatrix)
    g = 1/(1 + exp(-weightMatrix*x));
    for i = 1:length(g)
        if g(i) >= 0.5
            g(i) = 1;
        else
            g(i) = 0;
        end
    end
end