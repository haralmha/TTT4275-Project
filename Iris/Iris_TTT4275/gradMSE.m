function grad = gradMSE(g, t, x)
    grad = 0;
    for k = 1:size(g,2)
        grad = grad + ((g(:,k)-t(:,k)).*g(:,k).*(1-g(:,k)))*(x(:,k)');
    end
end