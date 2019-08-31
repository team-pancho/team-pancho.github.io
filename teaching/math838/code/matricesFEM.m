function [S,M]=matricesFEM(T)

% [S,M]=matricesFEM(T)
%
% Input:
%     T    : expanded triangulation data structure
% Output:
%     S    : stiffness matrix (sparse)
%     M    : mass matrix (sparse)
%
% Last modified: February 20, 2015

nE=size(T.elements,2);

% Matrices in the reference element

K11=0.5*[1 -1 0;-1 1 0;0 0 0];
K22=0.5*[1 0 -1;0 0 0;-1 0 1];
K12=0.5*[1 0 -1;-1 0 1;0 0 0];
M=1/24*[2 1 1;1 2 1;1 1 2];

% Assembly

R=repmat((1:3)',1,3);
R=reshape(T.elements(R,:),3,3,nE);
C=permute(R,[2 1 3]);
S=kron(T.c11,K11)+kron(T.c22,K22)+kron(T.c12,K12+K12');
S=sparse(R(:),C(:),S(:));
M=kron(T.detB,M);
M=sparse(R(:),C(:),M(:));

return  

