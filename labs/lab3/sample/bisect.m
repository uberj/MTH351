function [it_count,root,xn]=bisect(fcn,a0,b0,ep,max_iterate)
%
% function bisect(fcn,a0,b0,ep,max_iterate)
%
% This is the bisection method for solving an equation f(x)=0.
%
% The function f=fcn is a string. The function f is 
% to be continuous on the interval [a0,b0], and it is to be of 
% opposite signs at a0 and b0.  The quantity ep is the error 
% tolerance.  The routine guarantees this as an error bound 
% provided: (1) the restrictions on the initial interval are 
% correct, and (2) ep is not too small when the machine epsilon 
% is taken into account.  Most of these conditions are not 
% checked in the program!  The parameter max_iterate is an upper 
% limit on the number of iterates to be computed.
%
% For the given function f(x), an example of a calling sequence 
% might be the following:
%    root = bisect('x^2-1',1,1.5,1.0E-6,10)
% The parameter index_f specifies the function to be used.
%
% The following will optionally print out for each iteration the values
% of count, a, b, c, f(c), (b-a)/2
% with c the current iterate and (b-a)/2 the error bound for c.
% The variable count is the index of the current interate. 
  
it_count=0;
xn=a0;
if a0 >= b0
    disp('a0 < b0 is not true.  Stop!')
    root=NaN;
    return
end

a = a0; b = b0;
f=inline(fcn);
fa = feval(f,a); fb = feval(f,b);

if sign(fa)*sign(fb) > 0
    disp('f(a0) and f(b0) are of the same sign.  Stop!')
    root=NaN;
    return
end

c = (a+b)/2;
xsave=zeros(max_iterate,1); % for saving each iteration
xsave(it_count+1)=c;

while b-c > ep & it_count < max_iterate
    it_count = it_count + 1;
    fc = feval(f,c);
    %Internal print of bisection method:
    %format short e
    %iteration = [it_count a b c fc b-c]
    if sign(fb)*sign(fc) <= 0
        a = c;
        fa = fc;
    else
        b = c;
        fb = fc;
    end
    c = (a+b)/2;
    xsave(it_count+1)=c;
end

root = c;
xn=xsave(1:it_count+1);

%format long
%root
%format short e
%error_bound = b-c
%format short
%it_count

