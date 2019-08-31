function [U,x,t]=heatForwardFD(D,interval,T,u0,left,right,N,M)

% [U,x,t]=heatForwardFD(D,[a b],T,u0,left,right,N,M)
% Input:
%      D     : diffusion parameter
%      [a b] : space interval
%      T     : final time
%      u0    : initial condition (function)
%      left  : boundary condition at a (function)
%      right : boundary condition at b (function)
%      N     : number of points in space
%      M     : number of time steps
% Output:
%      U     : (N+2) x (M+1) matrix u_ij \approx u(x_i,t_j)
%      x     : (N+2)-vector with space grid
%      t     : (N+1)-vector with time steps

% Parameters for discretization and grids

h=(interval(2)-interval(1))/(N+1);
x=interval(1)+h*(0:N+1);
k=T/M;
t=k*(0:M);

% Evaluation of the initial condition

U=zeros(N+2,M+1);
U(:,1)=u0(x);

% Matrices and RHS

A=[-ones(N,1) 2*ones(N,1) -ones(N,1)];
A=k*D/h^2*spdiags(A,[-1 0 1],N,N);
int=2:N+1;    % list of indices corresponding to interior points
BC = @(t) k*D/h^2*[left(t);zeros(N-2,1);right(t)]; % a clever trick

% Time-stepping

for n=1:M
    U(1,n+1)  =left((n+1)*k);
    U(N+2,n+1)=right((n+1)*k);
    U(int,n+1)=U(int,n)-A*U(int,n)+BC(n*k);
end

return

