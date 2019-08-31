function uh=P1FEMdiffusion(T,c,f,uD,uN)

% function u=P1FEMdiffusion(T,c,f,uD,uN)
%
% -\Delta u + c u = g     in Omega
%               u = uD    on Gamma_D
%    \partial_n u = uN.n  on Gamma_N
% Input:
%     T     : basic triangulation
%     c     : constant parameter
%     f     : vectorized function of two variables (source)
%     uD    : vectorized function of two variables (Dirichlet B.C.)
%     uN    : vectorized function of two variables
%             with two components   (uN.n = Neumann B.C.)
% Output:
%     uh    : P1-FEM approximation
%
% Last modified: February 23, 2015

T=expandFEMgrid(T);
nC=size(T.coordinates,1);
uh=zeros(nC,1);

[S,M]=matricesFEM(T);
[ld,trc,Dir,Free]=vectorsFEM(T,f,uN);

matrix  = S+c*M;
uh(Dir) = uD(T.coordinates(1,Dir),T.coordinates(2,Dir));
rhs     = ld+trc-matrix(:,Dir)*uh(Dir);
uh(Free)= matrix(Free,Free)\rhs(Free);

return  

