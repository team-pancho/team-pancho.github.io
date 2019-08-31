function [U,R,Q]=householder(A)

% [U,R,Q]=householder(A)
% Input:
%     A    : m x n assumed to be of rank n
% Output:
%     U    : m x n matrix with columns u_1,\ldots,u_n
%     R    : upper triangular m x n matrix
%     Q    : m x n unitary matrix Q=H_{u_1}.... H_{u_n}
%                A = Q*R (Householder method for full QR)
% Last update: March 2, 2014

m=size(A,1);
n=size(A,2);
U=zeros(m,n);
for k=1:n
    c=A(k:m,k);
    s=sign(c(1));
    v=c+s*norm(c)*[1;zeros(m-k,1)];   % c_k+sign(s_k)\|c_k\| e_1
    v=(1/norm(v))*v;
    U(:,k)=[zeros(k-1,1);v];
    A(k:m,k:n)=A(k:m,k:n)-2*v*(v'*A(k:m,k:n));  
end
Q=eye(m);
for k=n:-1:1
    Q(k:m,:)=Q(k:m,:)-2*U(k:m,k)*(U(k:m,k)'*Q(k:m,:));
end
R=A;
return
