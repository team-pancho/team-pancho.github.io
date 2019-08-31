function [l2error,h1error]=computeFEMerror(T,uh,u,ux,uy)

% [l2error,h1error]=computeFEMerror(T,uh,u,ux,uy)
%
% Input:
%      T    : basic triangulation
%      uh   : vector of nodal values of u_h
%      u    : function
%      ux   : partial_x u
%      uy   : partial_y u
% Output:
%      l2error : \| u-u_h\|_{L^2}
%      h1error : \|\grad u -\grad u_h\|_{L^2}
%
% Last modified: February 20, 2015

% Seven point quadrature formula with order 5

nodes = [0.333333333333333 0.333333333333333 0.333333333333333; ...
	   0.059715871789770 0.470142064105115 0.470142064105115; ...
	   0.470142064105115 0.059715871789770 0.470142064105115; ...
	   0.470142064105115 0.470142064105115 0.059715871789770; ...
	   0.797426985353087 0.101286507323456 0.101286507323456; ...
	   0.101286507323456 0.797426985353087 0.101286507323456; ...
	   0.101286507323456 0.101286507323456 0.797426985353087];
weights = 0.5*[0.225000000000000 ...	   
	           0.132394152788506 ...
	           0.132394152788506 ...
	           0.132394152788506 ...
	           0.125939180544827 ...
	           0.125939180544827 ...
	           0.125939180544827];

x=T.coordinates(1,:); x=nodes*x(T.elements);      % x coordinates of quadrature points
y=T.coordinates(2,:); y=nodes*y(T.elements);      % y coordinates of quadrature points
T=expandFEMgrid(T);

% L2 error

uint=nodes*uh(T.elements);    % Value of u_h at all the quadrature points
u   =u(x,y);                  % Value of u at all the quadrature points
l2error=sqrt(dot( T.detB, weights*(uint-u).^2 ));

% H1 error

uhx = sum(uh(T.elements).*[T.g11; T.g12; T.g13]);    
uhy = sum(uh(T.elements).*[T.g21; T.g22; T.g23]);
ux  = ux(x,y);
uy  = uy(x,y);
error=bsxfun(@minus,uhx,ux).^2+bsxfun(@minus,uhy,uy).^2;  % Errors in quad points
h1error=sqrt(dot( T.detB, weights*error ));

return
