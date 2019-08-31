
% Script to test the composite midpoint rule (March 22, 2013)

f = @(x) exp(x);
a = 0.;
b = 2.;
exact=exp(2)-1;    % exact value of integral

listm = 2.^(0:6);  % 1st list of values of m that we will use
value = [];        % we will accummulate the approximations here
h     = (b-a)./listm;   % what is this?
for m=listm
    integral=midpointrule(f,[a b],m);
    value=[value integral];
end
errors=abs(value-exact);

