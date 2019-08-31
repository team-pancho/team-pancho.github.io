function [w,t]=heun(f,tinit,tfinal,yinit,n)

% [w,t]=heun(f,tinit,tfinal,yinit,n)
% Input:
%     f      : function of two variables
%     tinit  : initial time
%     tfinal : final time
%     yinit  : initial value (at t=tinit)
%     n      : number of time-steps
% Output:
%     w      : vector with n+1 components w_i \approx y(t_i) 
%              (Heun's method for y'=f(t,y), y(tinit)=yinit
%     t      : vector with n+1 components (times)

t=linspace(tinit,tfinal,n+1);
h=(tfinal-tinit)/n;
w=zeros(1,n+1);       % (optional) we create the room to store the solution
w(1)=yinit;           % initial value
for i=1:n
    k1=f(t(i),w(i));
    k2=f(t(i)+h,w(i)+h*k1);
    w(i+1)=w(i)+h*0.5*k1+h*0.5*k2;
end
return

