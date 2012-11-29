function [res,time]=lsqv2(m)
% This version does not need maple or the symbolic toolbox as the integral
% int(x^k*fcn,x=0..1) is hard coded, however, this means that the formula
% for the integral would have to be modified if a function other than
% exp(x) were considered.
  
  
  fcn='exp(x)';
  f=inline(fcn);
  b=zeros(m+1,1);
  

  % setup right hand side: int(x^k*fcn,x=0..1)
  %k=0:
  b(1)=-1+exp(1);
  
  kfac=1;
  for k=1:m,
    %b(k+1)=str2num(maple('int',sprintf('x^%d*%s',k,fcn),'x=0..1'));
    kfac=kfac*k;
    sumj=(-1)^k*kfac;
    jfac=1;
    for j=1:k,
      jfac=jfac*j;
      sumj=sumj + (-1)^(k-j)*kfac/jfac;       
    end
    b(k+1)=(-1)^(k-1)*kfac + exp(1)*sumj ;
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
  disp(max(abs(y-f(t))))

