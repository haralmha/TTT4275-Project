found_correct = false;
found_uncorrect = false;
while ~found_correct || ~found_uncorrect
    i = randi(num_test);
    if (classified_testlab(i) == testlab(i)) && ~found_correct
        fprintf('Index %i: Classified as %i --> Labeled as %i\n', i,classified_testlab(i), testlab(i))
        found_correct = true;
    elseif (classified_testlab(i) ~= testlab(i)) && ~found_uncorrect
        fprintf('Index %i: Classified as %i --> Labeled as %i\n', i,classified_testlab(i), testlab(i))
        found_uncorrect = true;
    end
    x = zeros(28,28);
    x(:) = testv(i,:);
    figure(i)
    image(x)
end