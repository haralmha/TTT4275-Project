function grad = gradMSE(g, t, x)
    grad = zeros(size(g,1),size(x,1));
    for k = 1:size(g,2)
        grad = grad + ((g(:,k)-t(:,k)).*g(:,k).*(ones(size(g,1),1)-g(:,k)))*(x(:,k)');
    end
end