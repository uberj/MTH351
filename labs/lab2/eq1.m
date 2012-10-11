function y = eq1(x, n)
% The equation for the first problem part 1
%
% log(1-x) = (-1) * (sum(k=1 to k=n x^k/k))

    k = 0;
    y = 0;
    while k < n
        k = k + 1;
        y = y + power(x, k)/k;
    end
    y = y * -1.0;
