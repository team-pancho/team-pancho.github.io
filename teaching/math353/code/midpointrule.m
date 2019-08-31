function integral=midpointrule(f,interval,m)

% Mhf=midpointrule(f,[a b],m)
%
% Input:
%     f     : vectorized function of one variable
%     [a b] : vector with limits of integration interval
%     m     : number of subdivisions
% Output
%     Mhf   : approx of \int_a^b f(x) dx with composite midpoint rule

x=linspace(interval(1),interval(2),m+1);   % m subdivisions
h=(interval(2)-interval(1))/m;             % length of the subdivisions
mdp=0.5*(x(1:end-1)+x(2:end));             % midpoints of the intervals
integral=h*sum(f(mdp));                    % composite midpoint rule

return

