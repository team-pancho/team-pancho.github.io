function [r,hist]=newton(f,fp,x0,tol,itmax)

% [r,hist]=newton(f,fp,x0,tol,itmax)
% Input:
%     f      : function of one variable
%     fp     : the derivative of f
%     x0     : starting value for iterations
%     tol    : tolerance for stopping criterior
%     itmax  : maximum number of iterations
% Output:
%     r      : approximation of root of f using Newton's method
%     hist   : array with history of the iteration
% Last update: February 26, 2014

r = x0; 
hist = r;
for i=1:itmax
    d=f(r)/fp(r);
    r=r-d;
    hist=[hist r];
    if abs(d) < tol*abs(r)
        return
    end
end
display('Maximum number of iterations reached without convergence')
return
