function compweights=gaussweights(n)
% n = number of nodes used in the quadrature rule
  
  % setup right hand side: int(x^i,x=-1..1)
  b=zeros(n,1);
  for i=1:round(n/2),
    b(2*i-1)=2/(2*i-1);
  end
  
  % Lookup exact nodes and weights in a table:
  [nodes,weights]= gaussian_nw(n);
  
  % setup linear system for weights of Gaussian quadrature:
  A=flipud(vander(nodes)');

  % solve for coefficients using LU factorization and backsubstitution:
  x = GEpivot(A,b);

  compweights=x';
  
  % plot comparision of exact and computed weights:
  figure
  plot(nodes,weights,'o')
  hold on
  plot(nodes,compweights,'*')
  title(sprintf('Weights for Gaussian quadrature using %d nodes',n)); 


function [x,w] = gaussian_nw(N)
% Returns nodes x and weights w for N point gaussian quadrature on [-1,1]
% N must be 2, 4, 8, 16, 32, 64 
%
% Based on Epperson: An Introduction to Numerical Methods and Analysis as
% found on wiley.com
%
% Created 4/18/2005, Brian M. Adams

switch N,
    
 case 2
  xh=0.577350269189626;
  wh=1.000000000000000;
  
 case 4
  xh=[0.339981043584856, 0.861136311594053];
  wh=[0.652145154862546, 0.347854845137454];
     
 case 8
  xh=[0.183434642495650, 0.525532409916329, 0.796666477413627, 0.960289856497536];
  wh=[0.362683783378362, 0.313706645877887, 0.222381034453374, 0.101228536290376];
     
 case 16
  xh=[0.09501250983764, 0.28160355077926, 0.45801677765723, 0.61787624440264, ...
      0.75540440835500, 0.86563120238783, 0.94457502307323, 0.98940093499165];
  wh=[0.18945061045507, 0.18260341504492, 0.16915651939500, 0.14959598881658, ...
      0.12462897125553, 0.09515851168249, 0.06225352393865, 0.02715245941175];
 
 case 32
  xh=[0.04830766568774, 0.14447196158280, 0.23928736225214, 0.33186860228213, ...
      0.42135127613064, 0.50689990893223, 0.58771575724076, 0.66304426693022, ...
      0.73218211874029, 0.79448379596794, 0.84936761373257, 0.89632115576605, ...
      0.93490607593774, 0.96476225558751, 0.98561151154527, 0.99726386184948];
  wh=[0.09654008851473, 0.09563872007927, 0.09384439908080, 0.09117387869576, ...
      0.08765209300440, 0.08331192422695, 0.07819389578707, 0.07234579410885, ...
      0.06582222277636, 0.05868409347854, 0.05099805926238, 0.04283589802223, ...
      0.03427386291302, 0.02539206530926, 0.01627439473091, 0.00701861000947];
     
 case 64
  xh=[0.02435029266342, 0.07299312178780, 0.12146281929612, 0.16964442042399, ...
      0.21742364374001, 0.26468716220877, 0.31132287199021, 0.35722015833767, ...
      0.40227015796399, 0.44636601725346, 0.48940314570705, 0.53127946401989, ...
      0.57189564620263, 0.61115535517239, 0.64896547125466, 0.68523631305423, ...
      0.71988185017161, 0.75281990726053, 0.78397235894334, 0.81326531512280, ...
      0.84062929625258, 0.86599939815409, 0.88931544599511, 0.91052213707850, ...
      0.92956917213194, 0.94641137485840, 0.96100879965205, 0.97332682778991, ...
      0.98333625388463, 0.99101337147674, 0.99634011677196, 0.99930504173577];
  wh=[0.04869095700914, 0.04857546744150, 0.04834476223480, 0.04799938859646, ...
      0.04754016571483, 0.04696818281621, 0.04628479658131, 0.04549162792742, ...
      0.04459055816376, 0.04358372452932, 0.04247351512365, 0.04126256324262, ...
      0.03995374113272, 0.03855015317862, 0.03705512854024, 0.03547221325688, ...
      0.03380516183714, 0.03205792835485, 0.03023465707240, 0.02833967261426, ...
      0.02637746971505, 0.02435270256871, 0.02227017380838, 0.02013482315353, ...
      0.01795171577570, 0.01572603047602, 0.01346304789672, 0.01116813946013, ...
      0.00884675982636, 0.00650445796898, 0.00414703326056, 0.00178328072170];
  
 otherwise
  
  error('Invalid number of quadrature points.')
  
end

x=[-fliplr(xh), xh];
w=[fliplr(wh), wh];
