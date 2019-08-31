function YY=nested(x,c,XX)

% YY=nested(x,c,XX)
%
% Nested evaluation of a polynomial
% Input:
%    x  : vector with n+1 components
%    c  : vector of n+1 coefficients
%    XX : points for evaluation 
% Output:
%    YY : evaluation of the polynomial at points XX

n=length(c)-1;
YY=c(n+1);       % YY=c(end)
for i=n:-1:1     % from n to 1 backwards
    YY=c(i)+(XX-x(i)).*YY;
end
return
