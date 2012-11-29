function [x, iflag, itnum] = CG(A,b,x0,delta,max_it)
% 
% funtion [x, iflag, itnum] = CG(A,b,x0,delta,max_it)
%  Solves A*x = b using Conjugate Gradient Iterative Method of solving
%  Symmetric and Positive Definite Matrices. 
%
%  Input:
%  Tol = delta, max number of iterations = max_it, x0 = initial iterate.
  

% initialize variables

  iflag = 1;
  x = 0.*b; % actually don't use x0
  r = b;
  p = r;
  rn = r' * r;
  delta2 = delta^2;
  
% Conjugate Gradient Algorithm  

  for itnum = 2:max_it+1,  % because Matlab doesn't like 0 for an index
    a = (r' * r)/(p' * A * p);
    x = x + a*p;
    r = r - a*A*p;
    B = (r' * r)/rn;
    p = r + B*p;
    rn = r' * r;    % norm of the residual
    if rn < delta2
      break;
    end
  end
  
  if itnum > max_it+1
    sprintf('%s','Warning:  Exceeded maximum iterations.  Error is: %g',rn)
    iflag = -1;
  end



