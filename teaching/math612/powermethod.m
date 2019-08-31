function [lnew,x]=powermethod(A,x0,tol,itMax)

% [lnew,x]=powermethod(A,x0,tol,itMax)
%
% Input:
%      A    : n x n matrix
%      x0   : column vector with n components
%      tol  : relative tolerance for stopping criterion
%      itMax: maximum number of iterations
% Output:
%      lnew : approximate eigenvalue
%      x    : approximate eigenvector (column vector)
%
% Last modified: February 11, 2014

y=A*x0;
lold=Inf;
for n=1:itMax
    x=(1/norm(y))*y;
    y=A*x;
    lnew=dot(x,y);
    if abs(lnew-lold)<tol*abs(lnew)
        return
    end
    lold=lnew;
end
display('Maximum number of iterations reached without convergence');
lnew=[];
x=[];
return


