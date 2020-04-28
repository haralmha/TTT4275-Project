found_correct = false;
found_uncorrect = false;
while ~found_correct || ~found_uncorrect
    i = randi(num_test);
    if (classified_testlab(i) == testlab(i)) && ~found_correct
        fprintf('Index %i: Classified as %i --> Labeled as %i\n', i,classified_testlab(i), testlab(i))
        found_correct = true;
        x = zeros(28,28);
        x(:) = testv(i,:);
        figure(1)
        image(x')
        title('Correctly classified')
    elseif (classified_testlab(i) ~= testlab(i)) && ~found_uncorrect
        fprintf('Index %i: Classified as %i --> Labeled as %i\n', i,classified_testlab(i), testlab(i))
        found_uncorrect = true;
        x = zeros(28,28);
        x(:) = testv(i,:);
        figure(2)
        image(x')
        title('Misclassified')
    end
end