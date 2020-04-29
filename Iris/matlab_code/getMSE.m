function mse = getMSE(g, t)
    mse = 0;
    N = size(g, 2);
    for k = 1:N
        mse = mse + 1/2*((g(:,k) - t(:,k))')*(g(:,k) - t(:,k));
    end
end