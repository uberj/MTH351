function y = inside_function(x)
    y = exp(-x);

function y = eq2b_fixed (x)
    y = ((1 - taylor(inside_function, 10))/x);
