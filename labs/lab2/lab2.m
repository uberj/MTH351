%% Problem 1
%%
% a. log(1.9)  = log(1-(-0.9))
x = -0.9
%%
% b.
% xtrue = 0.6418538861
digits_of_accuracy = 11;
xtrue = 0.6418538861;
k = 1;
while abs(eq1(-0.9, k) - xtrue) > power(10, (-1) * digits_of_accuracy)
    k = k + 1
end
xcalc = eq1(-0.9, k)

disp(sprintf('True value: %0.11f', xtrue));
disp(sprintf('Calculated at %d (terms) iterations: %0.11f', k, xcalc));
