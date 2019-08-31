% Parameters for the problem, initial condition, and boundary conditions

D=0.5;
a=0;b=1;
T=1;
u0   = @(x) x.^2.*(1-x).^2;
left = @(t) t.*(t<0.5)+0.5*(t>=0.5);
right= @(t) 0*t;

% N and M are discretization quantities: N in space, M in time

N=20;
M=450;    
          % M=430 is unstable in a funny way 
          % M=450 is fine
          % M=400 is very unstable
          % M=300 is very unstable
          
k=T/M;          % time-step
h=(b-a)/(N+1);  % mesh-size
disp(D*k/h^2);  % YOU NEED TO LOOK AT THIS NUMBER

[U,x,t]=heatForwardFD(D,[a b],T,u0,left,right,N,M);

% This makes an animation of the solution as time evolves

plot(x,u0(x))
for n=2:M+1
    plot(x,U(:,n)) 
    pause(0.05)
end


