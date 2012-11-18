%% Lab5

%% Problem 1
% Trapizoidal

%%
% a.1  'exp(-x^2)'

a=0;
b=2;
n0=2;
f='exp(-x^2)';
[inT,diT,raT]=trapezoidal(a,b,n0,f);
fprintf(strcat('\nFunction: ', f))
fprintf('\n \tIntegral \tDifference \tRatio\n')
for i=1:length(inT),
fprintf('%d\t%0.12f\t%0.5e\t%g\n', n0*2^(i-1),inT(i),diT(i),raT(i))
end

%%
% b.1
% Using Trapizoidal on this integral works reasonably well because on
% the interval being integrated e^(-x^2) is relativly linear.
% Trapizoidal does a very good job of estimation the area under the
% curve of a near linear functions.


%%
% a.2 '1/(1 + x^2)'
a=0;
b=4;
n0=2;
f='1/(1 + x^2)';
[inT,diT,raT]=trapezoidal(a,b,n0,f);
fprintf(strcat('\nFunction: ', f))
fprintf('\n \tIntegral \tDifference \tRatio\n')
for i=1:length(inT),
fprintf('%d\t%0.12f\t%0.5e\t%g\n', n0*2^(i-1),inT(i),diT(i),raT(i))
end

%%
% b.2
% The function 1/(1 + x^2) has a second derivative very near zero on
% the interval [0, 4]. This is why Trapizoidal does very well when
% approximating this function's integral.

%%
% a.3 '1/(2 + sin(x))'
a=0;
b=2*pi;
n0=2;
f='1/(2 + sin(x))';
fprintf(strcat('\nFunction: ', f))
[inT,diT,raT]=trapezoidal(a,b,n0,f);
fprintf('\n \tIntegral \tDifference \tRatio\n')
for i=1:length(inT),
fprintf('%d\t%0.12f\t%0.5e\t%g\n', n0*2^(i-1),inT(i),diT(i),raT(i))
end

%%
% b.3
% The function 1/(2 + sin(x)) does very poorly when it's approximated
% using Trapizoidal rule. This poor behavior is because on the interval
% [0, 2pi] the function is nearly quadratic in some points this causes
% a lot of error at those points. On other points it's curve the
% function is nearly linear and trapizoidal does okay.

%%
% a.4 'x^(1/2)'
a=0;
b=1;
n0=2;
f='x^(1/2)';
[inT,diT,raT]=trapezoidal(a,b,n0,f);
fprintf(strcat('\nFunction: ', f))
fprintf('\n \tIntegral \tDifference \tRatio\n')
for i=1:length(inT),
fprintf('%d\t%0.12f\t%0.5e\t%g\n', n0*2^(i-1),inT(i),diT(i),raT(i))
end

%%
% b.4 The function x^(1/2) is consistently not linear and so doesn't
% have the irradic behavior of the function of a.3, but still has a
% lower ratio of errors than the function in a.2

%% Problem 2
% Simpson

%%
% a.1  'exp(-x^2)'
fprintf('\n\n******************************\n* Approximation with Simpson *\n******************************\n')

a=0;
b=2;
n0=2;
f='exp(-x^2)';
[inS,diS,raS]=simpson(a,b,n0,f);
fprintf(strcat('\nFunction: ', f))
fprintf('\n \tIntegral \tDifference \tRatio\n')
for i=1:length(inS),
fprintf('%d\t%0.12f\t%0.5e\t%g\n', n0*2^(i-1),inS(i),diS(i),raS(i))
end

%%
% b.1
% f is nearly a degree 2 polynomail on each interval so simpson does
% a really good job of aproximating it.


%%
% a.2 '1/(1 + x^2)'
a=0;
b=4;
n0=2;
f='1/(1 + x^2)';
[inS,diS,raS]=simpson(a,b,n0,f);
fprintf(strcat('\nFunction: ', f))
fprintf('\n \tIntegral \tDifference \tRatio\n')
for i=1:length(inS),
fprintf('%d\t%0.12f\t%0.5e\t%g\n', n0*2^(i-1),inS(i),diS(i),raS(i))
end

%%
% b.2
% The function '1/(1 + x^2)' is nearly linear on the interval [0, 4]
% and so simpson does a pretty good job at approximating it, but it's
% not much better than Trap.

%%
% a.3 '1/(2 + sin(x))'
a=0;
b=2*pi;
n0=2;
f='1/(2 + sin(x))';
fprintf(strcat('\nFunction: ', f))
[inS,diS,raS]=simpson(a,b,n0,f);
fprintf('\n \tIntegral \tDifference \tRatio\n')
for i=1:length(inS),
fprintf('%d\t%0.12f\t%0.5e\t%g\n', n0*2^(i-1),inS(i),diS(i),raS(i))
end

%%
% b.3
% Trapazoidal does a better job at approximating this function than
% Simpson does. This could be happening because the Trapizoidal's
% linear estimates could guess the actual value better than
% Simpsons quadratic estimates.

%%
% a.4 'x^(1/2)'
a=0;
b=1;
n0=2;
f='x^(1/2)';
[inS,diS,raS]=simpson(a,b,n0,f);
fprintf(strcat('\nFunction: ', f))
fprintf('\n \tIntegral \tDifference \tRatio\n')
for i=1:length(inS),
fprintf('%d\t%0.12f\t%0.5e\t%g\n', n0*2^(i-1),inS(i),diS(i),raS(i))
end

%%
% b.4
% Simpson can approximate quadratic functions with no error and since
% x^(1/2) is nearly quadratic on the interval [0, 1] it integrates
% the function much better than Trapizoidal did.

%% Problem 3
% TODO

%% Problem 4
% Gaussian Quadrature (GQ)

%%
% a.1  'exp(-x^2)'
fprintf('\n\n******************************************\n* Approximation with Gaussian Quadrature *\n******************************************\n')

a=0;
b=2;
n0=2;
f='exp(-x^2)';
[inG,diG,raG]=gausstable(a,b,n0,f);
fprintf(strcat('\nFunction: ', f))
fprintf('\n \tIntegral \tDifference \tRatio\n')
for i=1:length(inG),
fprintf('%d\t%0.12f\t%0.5e\t%g\n', n0*2^(i-1),inG(i),diG(i),raG(i))
end

%%
% b.1
% GQ does a very good job at approximating this function but both
% Simpson and Trapizoidal rules also do a very good job. Simpson and
% Trapizoidal are cheaper to calculate.


%%
% a.2 '1/(1 + x^2)'
a=0;
b=4;
n0=2;
f='1/(1 + x^2)';
[inG,diG,raG]=gausstable(a,b,n0,f);
fprintf(strcat('\nFunction: ', f))
fprintf('\n \tIntegral \tDifference \tRatio\n')
for i=1:length(inG),
fprintf('%d\t%0.12f\t%0.5e\t%g\n', n0*2^(i-1),inG(i),diG(i),raG(i))
end

%%
% b.2
% This function is also very well approximated by Simpson and
% Trapizoidal. Simpson does do a better job at approximating it's
% integral.

%%
% a.3 '1/(2 + sin(x))'
a=0;
b=2*pi;
n0=2;
f='1/(2 + sin(x))';
fprintf(strcat('\nFunction: ', f))
[inG,diG,raG]=gausstable(a,b,n0,f);
fprintf('\n \tIntegral \tDifference \tRatio\n')
for i=1:length(inG),
fprintf('%d\t%0.12f\t%0.5e\t%g\n', n0*2^(i-1),inG(i),diG(i),raG(i))
end

%%
% b.3
% Surprisingly, this function is still best approximated by
% Trapazoidal. GQ does do a better job at approximation than Simpson.

%%
% a.4 'x^(1/2)'
a=0;
b=1;
n0=2;
f='x^(1/2)';
[inG,diG,raG]=gausstable(a,b,n0,f);
fprintf(strcat('\nFunction: ', f))
fprintf('\n \tIntegral \tDifference \tRatio\n')
for i=1:length(inG),
fprintf('%d\t%0.12f\t%0.5e\t%g\n', n0*2^(i-1),inG(i),diG(i),raG(i))
end

%%
% b.4
% GQ approximates this function the best out of Trapizoidal and
% Simpson.
