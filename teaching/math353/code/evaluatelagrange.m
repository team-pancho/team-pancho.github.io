function Y=evaluatelagrange(x,y,X)

% Y=evaluatelagrange(x,y,X)
%
% Input:
%      x    : vector with n+1 entries (points x_i)
%      y    : vector with n+1 entires (points y_i)
%      X    : points where we want to evaluate
% Output:
%      Y    : values of the interpolant P at the points X

Y=0;
n=length(x)-1;
for k=1:n+1
    c=y(k);
    for j=[1:k-1 , k+1:n+1]      % list of 1 to n+1 w/o k
        c=c.*(X-x(j))./(x(k)-x(j));
    end
    Y=Y+c;
end
return
