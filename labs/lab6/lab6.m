%% Lab 6

%% Problem 1
%% 

fprintf('lsq approximations from n=1 to n=15\n')
fprintf('n\tResult\t\tMax Error\tTime\t\n')
for i=1:1:15,
    [res, time, mxerror] = lsq(i);
    fprintf('%d\t%0.12f\t%0.12f\t%d\n', i, res, mxerror, time);
end

%%
% 1.a
% The error when m equals 1,2, and 3 decreases as m grow.

%%
% 1.b
% There is an inflection point in the error when m reaches 4. When m
% reaches values larger than 4 it the error starts to increase as
% well.

%%
% 1.c
% You can see errors when m is 10, 9, 7 (a little bit), 2 (a little
% bit), and 1.

%%
% 1.d
% The error is almost cyclic. When 1 < n < 15 the error is bounded by
% 0.000058444302 (n = 4) and 800.108 (n = 15).

%%
% 1.e
% In this case the lowest degree polynomial (n = 1) is not the best.
% The best polynomial for 'exp(x)' is when (n = 4). For this case
% lower degree polynomials are better when their degree is near 4.
