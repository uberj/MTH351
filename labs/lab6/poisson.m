function [res, time, itnum]=poisson(m)
% m = number of points used to discretize [0,1]

  % count number of iterations
  itnum=1; 

  % set up the grid
  h = 1/(m+1);
  x = h:h:1-h;
  y = h:h:1-h;
  [X,Y] = meshgrid(x,y);
  
  % determine the linear system to be solved
  A = full(delsq(numgrid('S',m+2)));
  
  % specify the right hand side vector
  b = reshape((sin(pi*X).*sinh(pi*Y)*h^2),m^2,1);
  
  tic % for timing
  
  % solve system using Gaussian elimination and backsubstitution
  uhsv = GEpivot(A,b);
  
  % alternatively, solve system using an iterative method
  % (be sure to comment out GEpivot above when uncommenting this line) 
  %%[uhsv, iflag, itnum] = Jacobi(A,b,b,eps,100000);
  %%[uhsv, iflag, itnum] = GS(A,b,b,eps,100000);
  %%[uhsv, iflag, itnum] = CG(A,b,b,eps,100000);
  
  time=toc; % for timing
  
  % output norm of residual
  res = norm(b-A*uhsv);
  
  % reshape for plotting
  uhs = reshape(uhsv,m,m);
  
  % plot solution
  figure
  surf(X,Y,uhs);
  title(sprintf('Solution to Poisson problem using %d grid points',m))
  
