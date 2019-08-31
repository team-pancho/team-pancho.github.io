function [fp,x]=fixedpoint(g,x0,itmax,tol)

% [fp,x]=fixedpoint(g,x0,itmax,tol)
% Input:
%     g     : function
%     x0    : initial point for iteration
%     itmax : max number of iterations
%     tol   : tolerance for stopping criterion
% Output:
%     fp    : approximation of fixed point
%     x     : array with record of entire iteration

x(1)=x0;
for i=1:itmax 
    x(i+1)=g(x(i));
    if abs(x(i+1)-x(i))<tol
        fp=x(i+1);
        return
    end
end
fp=x(end);
display('Last iteration reached without convergence')
return

