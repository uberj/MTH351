function [res,time,maxerr]=lsq(m)

  fcn='exp(x)';
  f=inline(fcn);
  b=zeros(m+1,1);
  
  % setup right hand side: int(x^i*fcn,x=0..1)
  for i=0:m,
    b(i+1)=quad(sprintf('x.^%d.*%s',i,fcn),0,1);
    %b(i+1)=str2num(maple('int',sprintf('x^%d*%s',i,fcn),'x=0..1'));
  end
  
  % setup linear system for coefficients of P_m:
  A=hilb(m+1);
  
  %for timing
  tic
  
  % solve for coefficients using LU factorization and backsubstitution:
  x = GEpivot(A,b);
 
  %for timing
  time=toc;
  
  % compute norm of residual:
  res=norm(b-A*x);
  
  % plot solution:
  t=[0:.01:1];
  y=polyval(flipud(x),t);
  figure
  plot(t,y,'--')
  hold on
  plot(t,f(t))
  title(sprintf('Degree %d Least squares approximation to %s',m,fcn))
  
  % plot error in solution:
  figure
  plot(t,y-f(t))
  title(sprintf('Error in degree %d Least squares approximation to %s',m,fcn))

  maxerr=max(abs(y-f(t)));

