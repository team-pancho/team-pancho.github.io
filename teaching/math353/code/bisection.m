function root=bisection(f,a,b,tol)

% root=bisection(f,a,b,tol)
% Input:
%   f      : function 
%   [a,b]  : limits of interval
%   tol    : tolerance
% Output:
%   root   : approximated root in (a,b) by bisection method
% Update: February 19, 2014

fa=f(a); fb=f(b);
if fa*fb>=0
    error('The bisection method cannot find a root in this interval')
end
while (b-a)/2>tol
    c=(a+b)/2; fc=f(c);
    if fc==0
        break
    elseif fa*fc<0
        b=c; % fb=fc; (update not needed)
    else
        a=c; fa=fc;
    end
end
root=(a+b)/2;
return


   
           