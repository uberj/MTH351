function y = eq2(x, n)
% The equation for the first problem part 2
%
% log((1+x)/(1-x)) = (2) * (sum(k=1 to k=n (x^(2*k + 1)/(2*k - 1))))

    y = double(0);
    for k=1:n,;
        % (x^(2*k - 1)/(2*k - 1))
        y = y + (x ^ ((2 * k) - 1))/((2 * k) - 1);
    end
    y = y * (2);
