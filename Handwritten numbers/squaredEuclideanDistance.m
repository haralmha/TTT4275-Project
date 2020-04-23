function distSquared = squaredEuclideanDistance(p, q)
    distSquared = 0;
    dim = length(p);
    if dim ~= length(q)
        error("Input arguments must be of same dimensions");
    end
    for i = 1:dim
        distSquared = distSquared + (p(i) - q(i))^2;
    end
end