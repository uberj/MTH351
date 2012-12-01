%% Lab 6
fprintf(['asdf ' ...
    'asdf'])
%% Problem 1
%% 

fprintf('lsq approximations from n=1 to n=15\n')
fprintf('n\tResult\t\tMax Error\tTime\t\n')
for i=1:1:15,
    [res, time, mxerror] = lsq(i);
    fprintf('%d\t%0.12f\t%0.12f\t%d\n', i, res, mxerror, time)
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

fprintf('Jacobi\n')
for i=1:1:15,
    A=hilb(i+1);
    N=diag(diag(A));
    P=N-A;
    normv = norm(inv(N)*P);
    fprintf('n = %d\t norm = %0.12f\n', i, normv)

end

%%
% 1.f
% No, you cannot use Jacobi iteration because the norm of a hilbert
% matrix is always greater than zero. For the Jacobi method (which is
% basically fixed point iteration) to work, g' or M needs to be less
% than 1.

fprintf('gauss-seidel\n')
for i=1:1:15,
    A=hilb(i+1);
    N=tril(A);
    P=N-A;
    normv = norm(inv(N)*P);
    fprintf('n = %d\t norm = %0.12f\n', i, normv);
end

%%
% 1.g
% Yes, but only for matrixes of size n=1 and n=2. All other matricies
% have norms larger than one.

%% Problem 2
%%

Ns = [2, 4, 8, 32, 64];
for i=1:length(Ns),
    n = Ns(i);
    [compweights, A] = gaussweights(n);
    N_GS=tril(A);
    P_GS=N_GS-A;
    GS_norm = norm(inv(N_GS)*P_GS);

    N_J=diag(diag(A));
    P_J=N_J-A;
    J_norm = norm(inv(N_J)*P_J);
    fprintf(['==============\nn = %d\t\ncondition number = %0.5e\nJacobi' ...
     'norm = %0.5e\nGauss-seidel norm = %0.5e'], n, cond(A, inf), J_norm, GS_norm )
    compweights
    fprintf('\n')
end

%%
% 2.a
% The values for the weights in the book and the weights generated in
% the table are exactly the same for up to three digits of accuracy.

%%
% 2.b
% The condition values for n = 32 and n = 64 are relativly very large
% compared to when n is equal to 8, 4, and 2. Specifically, when n =
% 32 the condition number is 1282671494874.59 and when n = 64 K is
% 48500196769728348160. The high condition numbers mean the matrixs
% are ill-conditioned which mean there will be a lot of error when
% solving them.

%%
% 2.c and 2.d
% Jacobi and Gauss-Seidel can be applied but only when the norm of the
% matrix is strictly less than 1.

%% Problem 3
%%

%%
% To reduce the amount of code in my lab, I modified cubspline.m to
% accept a new argument 'sol_method' that chose which method to use
% when solving the system

    %   +  switch sol_method
    %   +    case 'GEpivot'
    %   +        [M,lu,piv] = GEpivot(A,b);
    %   +    case 'Jacobi'
    %   +        [M, iflag, itnum] = Jacobi(A,b,b,eps,100000);
    %   +    case 'GS'
    %   +        [M, iflag, itnum] = GS(A,b,b,eps,100000);
    %   +    case 'CG'
    %   +        [M, iflag, itnum] = CG(A,b,b,eps,100000);
    %   +    case 'triadag'
    %   +        [M, alpha, beta, ier] = tridiag(ld,di,ud,b,n-2,0);
    %   +  end
    %   +


%Ns = [8, 16, 64, 128, 256];
Ns = [64, 128, 256];
methods = {'GEpivot', 'Jacobi', 'GS', 'CG', 'triadag'};
for m=1:length(methods),
    method = methods{m};

    sprintf(['Using *%s* to solve tridiagonal system corresponding to' ...
        'natural cubic spline interpolation\n'], method)
    for i=1:length(Ns),
        n = Ns(i);
        time_e = 0;
        for j=1:50,
            [res,tme,itnum] = cubspline(n, method, 0);
            time_e = time_e + tme;
        end
        fprintf(['n = %d\titerations = %d\t Average run time over 50' ...
            'runs:%0.5e\t\n'], n, itnum, time_e/50.0);
    end
end

%%
% 3.a
% See printed table

%%
% 3.b
% In time, Jacobi preformed much better than Gaussian Elimination with
% Pivoting. When n was 256 Jocobi took roughly 0.00129 seconds and
% GEpivot took 0.1814 seconds. Jacobi beat GEpivot when n was 26 and
% 128 too. Jacobi usually took 45 iterations and GEpivot took 1
% iteration.

%%
% 3.c
% GS used 31 iterations and Jacobi used 45 iterations. GS is better
% because it uses calculated Jacobi values which accelerates its
% convergence.

%%
% 3.d
% GC uses less iterations than Jacobi and has a faster average time of
% completing when n is 64 and 128. When n is 256 Jacobi actually
% solves it's system faster than GC does.

%%
% 3.e
% Triadag is faster than all other methods and only takes 1 iteration
% (one round of forward and back substitution).
