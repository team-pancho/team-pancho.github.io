%% To start with...

% Example of use of RK4 for a system of ODE
% Every vector has to be a row vector!!

f = @(t,y) [y(2).^2-2*y(1), y(1)-y(2)-t.*y(2).^2]; % output is a row vector
t0=0;
tfinal=1;
y0=[0,1];

n=10;
[w,t]=rk4(f,t0,tfinal,y0,n);      % Simulation with RK4
[wE,t]=euler(f,t0,tfinal,y0,n);   % Simulation with Euler

        % Note: % w(:,1) contains the first component of w at all time

plot(t,w(:,1),t,w(:,2),...
     t,wE(:,1),'.',t,wE(:,2),'.');      
xlabel('t'), ylabel('y')
legend('RK4: y_1','RK2: y_2','Euler: y_1','Euler: y_2')   
        % check out how to use legend

%% The predator-prey problem (Lotka-Volterra equations)

% Comparison of Euler and RK4

alpha=2;
beta=1;
a=100;
b=100;

f = @(t,z) [alpha*z(1).*(1-z(2)/a),...
            -beta*z(2).*(1-z(1)/b)];
        
z0=[10,10];
t0=0;
tfinal=10;

n=100;
[w,t]=rk4(f,t0,tfinal,z0,n);      % Simulation with RK4
[wE,t]=euler(f,t0,tfinal,z0,n);   % Simulation with Euler

plot(t,w(:,1),t,w(:,2),...
     t,wE(:,1),'.',t,wE(:,2),'.');      
xlabel('t'), ylabel('animals')
legend('RK4: rabbits','RK4: foxes','Euler: rabbits','Euler: foxes')   

%   To learn from this one: use high order methods or short time-steps

pause       % Wait for ENTER 

tfinal=20;
n=200;
[w,t]=rk4(f,t0,tfinal,z0,n);      % Simulation with RK4
plot(t,w(:,1),t,w(:,2));
xlabel('t'), ylabel('animals')
legend('RK4: rabbits','RK4: foxes')   

%% The predator-prey problem (Lotka-Volterra equations)

% Phase plane plots. Comet plots.

alpha=2;
beta=1;
a=100;
b=200;

f = @(t,z) [alpha*z(1).*(1-z(2)/a),...
            -beta*z(2).*(1-z(1)/b)];
        
z0=[10,10];
t0=0;
tfinal=20;
n=20000;
[w,t]=rk4(f,t0,tfinal,z0,n);      % Simulation with RK4

plot(w(:,1),w(:,2));
xlabel('rabbits')
ylabel('foxes')

     % This is called a phase-plane plot
     % Useful for systems with 2 ODE and not explicit dependence of time
     
pause
comet(w(:,1),w(:,2));       % Animated plot of evolution

plot(w(:,1),w(:,2));
xlabel('rabbits')
ylabel('foxes')

%% Simple pendulum, damped pendulum

% theta'' + (g/L) sin(theta) + d theta'=0

g=9.81;
L=0.01;
d=1;         % damping   (d=0 is the simple pendulum)
f = @(t,y) [y(2), -g/L*sin(y(1))-d*y(2)];  

% time does not appear explicitly

t0=0;
tfinal=0.5;
y0=[pi/4, 0];      % initial angle=pi/9, initial angular velocity=0

n=5000;            % if you make n bigger animations will be slower
[w,t]=rk4(f,t0,tfinal,y0,n);      % Simulation with RK4

plot(t,w(:,1),t,w(:,2));
xlabel('time')
ylabel('variables')
legend('Angle','Angular velocity')

pause

plot(w(:,1),w(:,2),'w')      % plot of phase plane in white (invisible)
xlabel('Angle')
ylabel('Angular velocity')
hold on
comet(w(:,1),w(:,2))         % animation shown on top of white plot
hold off

pause

x=L*sin(w(:,1)); y=-L*cos(w(:,1)); % physical coordinates
plot(x,y,'w'),axis equal    
xlabel('x'),ylabel('y')
hold on
comet(x,y)
hold off




