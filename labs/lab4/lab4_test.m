% Name: Eric Zounes
% Date: 11/04/12
% Lab 4
 
% 1.
N = 10;
x = linspace(-5,5,N+1);
f = inline('1./(1+x.*x)', 'x');
y = f(x)
figure
plot(x,y,'o')
title('N+1 = 11 equally-spaced data points')
t = [-5:.1:5];
figure
plot(t,f(t),'-')
title('Runge function')

% 2.

PN = polyfit(x,y,N);
v = polyval(PN,t);
err = norm(f(t)-v,inf)

figure
plot(x,y,'o',t,f(t),'-',t,v,'--')
title(sprintf('f(t) and P_{10}(t), err%g', err))

% 3. Interpolation at Chebychev nodes:

% From the following Chebychev interpolation, we can see that it performs much
% better than equally spaced nodes. The equally spaced nodes from polyfit
% create polynomial which has a large degree of error when interpolating
% points near each end of the interval. We call this Runge's phenomenon.
% We expect that as we increase N, Chebychev should outperform polyfit.

K = N+1;
a = -5;
b = 5;
xcheb = zeros(1,K);
for i = 1:K
xcheb(i) = (a+b)/2 + (b-a)/2 * cos( (i-.5)*pi/K);
end
ycheb = f(xcheb);

PNcheb = polyfit(xcheb, ycheb, K-1);
vcheb = polyval(PNcheb, t)
cheberr = norm(f(t)-vcheb,inf)

figure
plot(xcheb,ycheb, 'o', t, f(t), '-', t, vcheb, '--')
title(sprintf('f(t) and P_{11}(t), cheb err %g', cheberr))
% 4. Repeat 1, 2, and 3 with N = 20 and N = 50. Explain what behavior you i
% observe.

% From the following graphs we can see that Chebyshev outperforms the
% standard polynomial interpolation for all N. The Chebychev equation is a
% type of affine transformation which helps reduce the amount of error
% introduced at the end points.

% N = 20.
N = 20;
x = linspace(-5,5,N+1);
f = inline('1./(1+x.*x)', 'x');
y = f(x)
figure
plot(x,y,'o')
title('N+1 = 21 equally-spaced data points')
t = [-5:.1:5];

PN = polyfit(x,y,N);
v = polyval(PN,t);
err = norm(f(t)-v,inf)

figure
plot(x,y,'o',t,f(t),'-',t,v,'--')
title(sprintf('f(t) and P_{20}(t), err%g', err))

K = N+1;
a = -5;
b = 5;
xcheb = zeros(1,K);
for i = 1:K
xcheb(i) = (a+b)/2 + (b-a)/2 * cos( (i-.5)*pi/K);
end
ycheb = f(xcheb);
PNcheb = polyfit(xcheb, ycheb, K-1);
vcheb = polyval(PNcheb, t)
cheberr = norm(f(t)-vcheb,inf)

figure
plot(xcheb,ycheb,'o', t, f(t), '-', t, vcheb, '--')
title(sprintf('f(t) and P_{21}(t), cheb err %g', cheberr))

% N = 50

N = 50;
x = linspace(-5,5,N+1);
f = inline('1./(1+x.*x)', 'x');
y = f(x)
figure
plot(x,y,'o')
title('N+1 = 51 equally-spaced data points')
t = [-5:.1:5];
PN = polyfit(x,y,N);
v = polyval(PN,t);
err = norm(f(t)-v,inf)

figure
plot(x,y,'o',t,f(t),'-',t,v,'--')
title(sprintf('f(t) and P_{50}(t), err%g', err))

K = N+1;
a = -5;
b = 5;
xcheb = zeros(1,K);
for i = 1:K
xcheb(i) = (a+b)/2 + (b-a)/2 * cos( (i-.5)*pi/K);
end
ycheb = f(xcheb);

PNcheb = polyfit(xcheb, ycheb, K-1);
vcheb = polyval(PNcheb, t)
cheberr = norm(f(t)-vcheb,inf)

figure
plot(xcheb,ycheb,'o', t, f(t), '-', t, vcheb, '--')
title(sprintf('f(t) and P_{51}(t), cheb err %g', cheberr))



