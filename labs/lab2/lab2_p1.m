%% Problem 1
%%
% a. log(1.9)  = log(1-(-0.9))
% To calculate log(1.9) x needs to be -0.9
reqx = -0.9;
%%
% b.
digits_of_accuracy = 11;
xtrue = 0.64185388617239469;
k = 1;
while abs(eq1(reqx, k) - xtrue) > power(10, (-1) * digits_of_accuracy)
    k = k + 1;
end
xcalc = eq1(reqx, k);
print('log(1.9) = log(1-(-0.9))');
disp(sprintf('True value: %0.11f', xtrue));
disp(sprintf('Calculated at %d (terms) iterations: %0.11f', k, xcalc));

%%
% c. (x^(2*k - 1)/(2*k - 1))
% To calculate log(1.9) x needs to be 0.9/2.9
reqx = 0.9/2.9;

%%
% d.
digits_of_accuracy = 11;
xtrue = 0.64185388617239469;
k = 1;
while abs(eq2(reqx, k) - xtrue) > power(10, (-1) * digits_of_accuracy);
    k = k + 1;
end
xcalc = eq2(reqx, k);
print(xcalc);

print('(x^(2*k - 1)/(2*k - 1))');
disp(sprintf('True value: %0.11f', xtrue));
disp(sprintf('Calculated at %d (terms) iterations: %0.11f', k, xcalc));

%%
% e. The second taylor seriese is better for approximating log(1.9) because it
% takes less iterations to get a value within 10 significant digits of
% accuracy. The second equations is faster because the exponent in the
% numerator is large and will cause the function to correct itself by less
% during each iteration which means it initially had a better estimate to start
% with.
