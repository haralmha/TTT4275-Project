x = zeros(28,28);
for i = 1:28
    x(:) = testv(i,:);
    figure(i)
    image(x)
end 


