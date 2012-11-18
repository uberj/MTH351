function [integral,difference,ratio]=trapezoidal(a,b,n0,f)
%
%  function [integral,difference,ratio]=trapezoidal(a,b,n0,f)
%
%  This uses the trapezoidal rule with n subdivisions to  
%  integrate the function f over the interval [a,b].  The 
%  values of n used are
%        n = n0,2*n0,4*n0,...,256*n0
%  The corresponding numerical integrals are returned in the 
%  vector integral.  The differences of successive numerical 
%  integrals are returned in the vector difference:
%        difference(i) = |integral(i)-integral(i-1)|,  i=2,...,9
%  The entries in ratio give the rate of decrease in these
%  differences.
%
%  Ex:
%  [integral,difference,ratio]=trapezoidal(0,2,2,'exp(-x^2)')

% Convert string to inline function
f=inline(f);
  
%  Initialize output vectors.
integral = zeros(9,1);
difference = zeros(9,1);
ratio = zeros(9,1);

% Initialize for trapezoidal rule.
sumend = (feval(f,a) +feval(f,b))/2;
sum = 0;

%  Initialize for case of n0 > 2.
if(n0 > 2)
    h = (b-a)/n0;
    for i=2:2:n0-2
        sum = sum + feval(f,a+i*h);
    end
end

%  Calculate the numerical integrals, doing each
%  by appropriately modifying the preceding case.
for i=1:9
    n = n0*2^(i-1);
    h = (b-a)/n;
    for k=1:2:n-1
        sum = sum + feval(f,a+k*h);
    end
    integral(i) = h*(sumend + sum);
end

%  Calculate the differences of the successive 
%  trapezoidal rule integrals and the ratio
%  of decrease in these differences.
difference(2:9)=abs(integral(2:9)-integral(1:8));
ratio(3:9)=difference(2:8)./difference(3:9);


