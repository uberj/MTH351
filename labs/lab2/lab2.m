%% Problem 1
%%
% a. log(1.9)  = log(1-(-0.9))
% To calculate log(1.9) x needs to be -0.9
reqx = -0.9
%%
% b.
digits_of_accuracy = 11;
xtrue = 0.6418538861;
k = 1;
while abs(eq1(reqx, k) - xtrue) > power(10, (-1) * digits_of_accuracy)
    k = k + 1;
end
xcalc = eq1(reqx, k)

disp(sprintf('True value: %0.11f', xtrue));
disp(sprintf('Calculated at %d (terms) iterations: %0.11f', k, xcalc));

%%
% c. (x^(2*k + 1)/(2*k - 1))
% To calculate log(1.9) x needs to be 0.9/2.9
reqx = double(0.31034482758620691)

%%
% d.
digits_of_accuracy = 10;
xtrue = 0.6418538861;
k = 1;
while abs(eq2(reqx, k) - xtrue) > power(10, (-1) * digits_of_accuracy)
    k = k + 1
end
xcalc = eq1(reqx, k)

disp(sprintf('True value: %0.11f', xtrue));
disp(sprintf('Calculated at %d (terms) iterations: %0.11f', k, xcalc));
