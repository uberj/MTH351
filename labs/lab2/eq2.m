function y = eq2(x, n)
% The equation for the first problem part 2
%
% log((1+x)/(1-x)) = (2) * (sum(k=1 to k=n (x^(2*k + 1)/(2*k - 1))))

    k = 0;
    y = double(0);
    while k < n
        k = k + 1;
        % (x^(2*k + 1)/(2*k - 1))
        y1 = power(x, ((2 * k) + 1))/((2 * k) - 1);
        y = y + power(x, ((2 * k) + 1))/((2 * k) - 1);
    end
    y = y * (2)
