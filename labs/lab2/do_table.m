function y = do_table(func, func_fixed)
    disp(sprintf('Table:'));
    disp(sprintf('x \t f(x) \t \t (fixed) f(x)'));
    iterations = 20;
    for i=1:iterations,
      x=10^(-i);
      disp(sprintf('%g \t %0.10f \t %0.10f', x, func(x), func_fixed(x)));
    end
