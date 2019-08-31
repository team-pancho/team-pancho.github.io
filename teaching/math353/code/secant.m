function r=secant(f,x0,x1,tol,itmax)

% r=secant(f,x0,x1,tol,itmax)
% Input:
%     f      : function of one variable
%     x0, x1 : starting values for iterations
%     tol    : tolerance for stopping criterior
%     itmax  : maximum number of iterations
% Output:
%     r      : approximation of root of f using the secant method
% Last update: February 26, 2014

for i=1:itmax
    d=f(x1)*(x1-x0)/(f(x1)-f(x0));
    r=x1-d;
    if abs(d)<tol*abs(r)
        return
    end
    x0=x1;
    x1=r;
end
display('Maximum number of iterations reached without convergence')
return

