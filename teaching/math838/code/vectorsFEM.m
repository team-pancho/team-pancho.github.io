function [ld,trc,Dir,Free]=vectorsFEM(T,f,g)

% [ld,trc,Dir,Free]=vectorsFEM(T,f,g)
%
% Input:
%     T    : expanded triangulation data structure
%     f    : vectorized function of two variables
%     g    : vectorized function of two variables
%            with values in R^2
% Output:
%     ld   : load vector (associated to f)
%     trc  : traction vector (associated to g)
%     Dir  : list of Dirichlet nodes
%     Free : list of free (independent, non-Dirichlet) nodes
%
% Last modified: February 20, 2015

nC=size(T.coordinates,2);

% Load vector

f=(f(T.baryc(1,:),T.baryc(2,:)).*T.detB)/6;
f=repmat(f,3,1);
ld=accumarray(T.elements(:),f(:),[nC,1]);

% Traction vector

if length(T.neumann)>0
    g=0.5*sum(g(T.midptNeu(1,:),T.midptNeu(2,:)).*T.normal,1);
    g=repmat(g,2,1);
    trc=accumarray(T.neumann(:),g(:),[nC,1]);
else
    trc=zeros(nC,1);
end

% Dir and Free nodes

Dir=unique(T.dirichlet);
Free=(1:nC)'; Free(Dir)=[];

return  

