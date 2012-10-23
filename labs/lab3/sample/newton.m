function [it_count,root,xn] = newton(fcn,dfcn,x0,error_bd,max_iterate)
%
% function newton(fcn,x0,error_bd,max_iterate)
%
% This is Newton's method for solving an equation f(x) = 0.
%
% The functions f(x)=fcn and deriv_f(x)=dfcn are strings.
% The parameter error_bd is used in the error test for the 
% accuracy of each iterate.  The parameter max_iterate
% is an upper limit on the number of iterates to be 
% computed.  An initial guess x0 must also be given.
%
% For the given function f(x), an example of a calling sequence 
% might be the following:
%    root = newton('x^2-1','2*x',.1,1.0E-12,10)
%
% The program _optionally_ prints the iteration values
%      iterate_number, x, f(x), deriv_f(x), error
% The value of x is the most current initial guess, called
% previous_iterate here, and it is updated with each iteration. 
% The value of error is 
%    error = newly_computed_iterate - previous_iterate
% and it is an estimated error for previous_iterate.


f=inline(fcn);
df=inline(dfcn);
error = 1;
it_count = 0;
xsave=zeros(max_iterate,1); % for saving each iteration
xsave(1)=x0;

while abs(error) > error_bd & it_count < max_iterate
    fx = feval(f,x0);
    dfx = feval(df,x0);
    if dfx == 0
        disp('The derivative is zero.  Stop')
	root=NaN;
        return
    end
    it_count = it_count + 1;
    x1 = x0 - fx/dfx;
    xsave(it_count+1)=x1;
    error = x1 - x0;
    %Internal print of newton method:
    %format short e
    %iteration = [it_count x0 fx dfx error]
    x0 = x1;
end

root = x1;
xn=xsave(1:it_count+1);

if it_count > max_iterate
    disp('The number of iterates calculated exceeded') 
    disp('max_iterate.  An accurate root was not')
    disp('calculated.')
end

%    format long
%    root
%    format short e
%    error
%    format short
%    it_count

