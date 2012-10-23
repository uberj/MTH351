function [it_count,root,xn] = secant(fcn,x0,x1,error_bd,max_iterate)
%
% function secant(fcn,x0,x1,error_bd,max_iterate)
%
% This implements the secant method for solving an 
% equation f(x) = 0. The function f=fcn is a string.
%
% The parameter error_bd is used in the error test for the 
% accuracy of each iterate.  The parameter max_iterate is an 
% upper limit on the number of iterates to be computed. Two 
% initial guesses, x0 and x1, must also be given.
%
% For the given function f(x), an example of a calling sequence 
% might be the following:
%    root = secant('x^2-1',x0,x1,1.0E-12,10)
%
% The program optionally prints the iteration values
%      iterate_number, x, f(x), error
% The value of x is the most current initial guess, called
% previous_iterate here, and it is updated with each iteration. 
% The value of error is 
%    error = newly_computed_iterate - previous_iterate
% and it is an estimated error for previous_iterate.

error = 1;
f=inline(fcn);
fx0 = feval(f,x0);
it_count = 0;
%format short e
%iteration = [it_count x0 fx0]
xsave=zeros(max_iterate,1); xn=x0; % for saving each iteration
xsave(1)=x0;
xsave(2)=x1;

while abs(error) > error_bd & it_count <= max_iterate
    fx1 = feval(f,x1);
    if fx1 - fx0 == 0
        disp('f(x1) = f(x0); Division by zero;  Stop')
	root=NaN;
        return
    end
    it_count = it_count + 1;
    x2 = x1 - fx1*(x1-x0)/(fx1-fx0);
    xsave(it_count+2)=x2;
    error = x2 - x1;
    %Internal print of secant method:
    %format short e
    %iteration = [it_count x1 fx1 error]
    x0 = x1;
    x1 = x2;
    fx0 = fx1;
end

root = x2;
xn=xsave(1:it_count+2);

if it_count > max_iterate
  disp('The number of iterates calculated exceeded') 
  disp('max_iterate.  An accurate root was not')
  disp('calculated.')
end

%format long
%root
%format short e
%error
%format short
%it_count


