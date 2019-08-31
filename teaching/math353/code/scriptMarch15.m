%%
% Test for forward approximation of the derivative

testFwdDiff  = @(f,x0,h) (f(x0+h)-f(x0))./h;

f = @(x) 2*x.^3;
x0=1;
exact=6;
h = input('Gimme h: ');
values=testFwdDiff(f,x0,h);
errors=abs(values-exact)
loglog(h,errors,'o-')    % loglog plot of errors
hold on
loglog(h,h,'r')       % straight line with slope = 2

% Valid input
%      0.01
%      [0.01 0.001 0.0001]
%      1./[100 1000 1000]
%      10.^(-(1:15))
% Also...
%   define hh = 10.^(-(1:15))
%   and type hh when asked for input

% To do:
%      check out examples for different values of h
%      compute the errors
%      make a list of values of h and error_h
%      make a loglog plot

%%
% Test for central approximation of the derivative

testCentDiff = @(f,x0,h) (f(x0+h)-f(x0-h))./(2*h);   % testing function

f = @(x) 2*x.^3;                % concrete data
x0=1;
exact=6;
h = 2.^(-(1:10));    % [1/2, 1/4, ..... ]

values=testCentDiff(f,x0,h);
errors=abs(values-exact)
loglog(h,errors,'o-')    % loglog plot of errors
hold on
loglog(h,h.^2,'r')       % straight line with slope = 2

