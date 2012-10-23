%% Lab 3

lib = make_lib();

%% Problem 1
%%
disp(sprintf('Table:'));
disp(sprintf('Initial Interval \t Approximation \t \t Error'));
x0 = 0.0;
x1 = 1.0;
[it_count, root, xn] = bisect(lib.f,x0,x1,lib.accuracy,10);
disp(sprintf('%g to %g \t\t\t %0.10f \t\t %0.10f', x0, x1, root, lib.the_root - root));

x0 = 0.2;
x1 = 2.0;
[it_count, root, xn] = bisect(lib.f,x0,x1,lib.accuracy,10);
disp(sprintf('%g to %g \t\t\t %0.10f \t\t %0.10f', x0, x1, root, lib.the_root - root));
