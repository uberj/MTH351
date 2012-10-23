tol=1e-6;
max_its=100;
fcn='x^6-x-1';
trueroot=[1.13472414];
intervals=[0.9, 2.7; 1, 2; 0.75, 1.25];

disp(sprintf('\nBisection estimate for root of %s with accuracy of %g:',fcn,tol));
disp(sprintf('_interval_ \t _estimate_ \t _error_ \t _iterations_'))

for i=1:size(intervals,1),
  [itiB(i),rootiB(i)]=bisect(fcn,intervals(i,1),intervals(i,2),tol,max_its);
  disp(sprintf('[%g,%g]    \t %0.8f \t %0.5e \t %d',...
	       intervals(i,:),rootiB(i),abs(trueroot-rootiB(i)),itiB(i)));
end
