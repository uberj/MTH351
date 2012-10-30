%% Lab 4
%%

%% Problem 1
%%
N = 10;
x = linspace(-5,5,N+1);
f = inline('1./(1+x.*x)','x');
y = f(x);
plot(x, y, 'o');
title('N+1 = 11 equally-spaced data points');
t = [-5:.1:5];
figure;
plot(t, f(t), '-');
title('Range function');

%% Problem 2
%%
PN = polyfit(x,y,N);
v = polyval(PN,t);
err = norm(f(t)-v,inf);
figure;
plot(x,y,'o',t,f(t),'-',t,v,'--')
title(sprintf('f(t) and P {10}(t), err=%g',err))

%% Problem 3
%%
K = N+1;
a = -5;
b = 5;
xcheb = zeros(1,K);
for i=1:K
    xcheb(i)=(a+b)/2 + (b-a)/2 * cos( (i-.5)*pi/K );
end
ycheb = f(xcheb);
PNcheb = polyfit(xcheb,ycheb,N);
vcheb = polyval(PNcheb,t);

cheberr = norm(f(t)-vcheb,inf);
figure;
plot(x,y,'o',t,f(t),'-',t,vcheb,'--')
title(sprintf('f(t) and Chebychev Interpolation {10}(t), err=%g',cheberr))

%% Problem 4
%%
