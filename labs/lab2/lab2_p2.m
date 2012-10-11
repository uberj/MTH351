%%
% 2.

%%
% a. ((4 + x)^(-1/2) - 2) / x
print('f(x) = ((4 + x)^(-1/2) - 2) / x')
print('f_fixed(x) = 1/(sqrt(4 + x) + 2);')
do_table(@eq2a, @eq2a_fixed)
disp(sprintf('\n'));

% The 'fixed' function removes the subtraction of large numbers that are
% nearly equal to eachother. This allows better accuracy.

%%
% b. (1 - e^(-x))/x
print('f(x) = (1 - e^(-x))/x')
do_table(@eq2b, @eq2b)
disp(sprintf('\n'));
