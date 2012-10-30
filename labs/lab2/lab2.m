%% Lab 2

%% Problem 1
%%
print('Problem 1.')
disp(sprintf('\n'));
ten_digits_of_accuracy =.5E-10;
%%
% a. log(1.9)  = log(1-(-0.9))
% To calculate log(1.9) x needs to be -0.9
reqx = -0.9;

%%
% b.
xtrue = 0.64185388617239469;
k = 1;
while abs(eq1(reqx, k) - xtrue) > ten_digits_of_accuracy
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
xtrue = 0.64185388617239469;
k = 1;
while abs(eq2(reqx, k) - xtrue) > ten_digits_of_accuracy;
    k = k + 1;
end
xcalc = eq2(reqx, k);
print(xcalc);

print('(x^(2*k - 1)/(2*k - 1))');
disp(sprintf('True value: %0.11f', xtrue));
disp(sprintf('Calculated at %d (terms) iterations: %0.11f', k, xcalc));

%%
% e. The second Taylor series is better for approximating log(1.9) because it
% takes less iterations to get a value within 10 significant digits of
% accuracy. The second equations is faster because the exponent in the
% numerator is larger than the exponent in the first equation. The larger
% exponent means the second equation has a faster rate of convergence.


%% Problem 2.
%%
disp(sprintf('\n'));
disp(sprintf('\n'));

%%
% a. ((4 + x)^(-1/2) - 2) / x
print('f(x) = ((4 + x)^(-1/2) - 2) / x')
print('f_fixed(x) = 1/(sqrt(4 + x) + 2);')
do_table(@eq2a, @eq2a_fixed)
disp(sprintf('\n'));

%%
% The first function adds a very small number to 4 and than takes the square
% root of the sum. When x because so small that 4 + x is rounded to 4 (because
% of the limitations associated with representing floating point numbers)
% 'sqrt(4+x) - 2' becomes equal to 0.  The 'better' function removes the subtraction
% of the two nearly equal numbers and consequently removes the error.
%%
% b. (1 - e^(-x))/x
print('f(x) = (1 - e^(-x))/x')
do_table(@eq2b, @eq2b_fixed)
disp(sprintf('\n'));

%%
% The first function was subtracting something very close to 1 from 1 itself.
% This caused a zero value to be in the numerator which caused the function to
% evaluate to zero. By using a Taylor series we can use the expanded terms to
% make the numerator non-zero after subtraction.

%% The code.
%function y = do_table(func, func_fixed)
%    disp(sprintf('Table:'));
%    disp(sprintf('x \t f(x) \t \t (fixed) f(x)'));
%    iterations = 20;
%    for i=1:iterations,
%      x=10^(-i);
%      disp(sprintf('%g \t %0.10f \t %0.10f', x, func(x), func_fixed(x)));
%    end
%
%function y = eq1(x, n)
%    k = 0;
%    y = 0;
%    while k < n
%        k = k + 1;
%        y = y + power(x, k)/k;
%    end
%    y = y * -1.0;
%
%function y = eq2a_fixed (x)
%    y = 1/(sqrt(4 + x) + 2);
%
%function y = eq2a (x)
%    y = (sqrt(4 + x) - 2) / x;
%
%function y = inside_function(x)
%    y = exp(-x);
%
%function y = eq2b_fixed (x)
%    y = ((1 - taylor(inside_function, 10))/x);
%
%function y = eq2b (x)
%    y = (1 - exp(-x))/x;
%    j
%function y = eq2(x, n)
%    y = double(0);
%    for k=1:n,;
%        % (x^(2*k - 1)/(2*k - 1))
%        y = y + (x ^ ((2 * k) - 1))/((2 * k) - 1);
%    end
%    y = y * (2);
%
%function text = print(s)
%    disp(s);
