function [w,t]=rk4(f,tinit,tfinal,yinit,n)

% [w,t]=rk4(f,tinit,tfinal,yinit,n)
% Input:
%     f      : function of two variables (second variable is a d-vector)
%     tinit  : initial time
%     tfinal : final time
%     yinit  : initial value (at t=tinit)
%     n      : number of time-steps
% Output:
%     w      : n+1 x d matrix  w(i,:) ~= y(t_i) 
%     t      : vector with n+1 components (times)

t=linspace(tinit,tfinal,n+1);
h=(tfinal-tinit)/n;
w=zeros(n+1,length(yinit));       % create room to store the solution
w(1,:)=yinit;                     % initial value
for i=1:n
    k1=f(t(i),w(i,:));
    k2=f(t(i)+h/2,w(i,:)+h/2*k1);
    k3=f(t(i)+h/2,w(i,:)+h/2*k2);
    k4=f(t(i)+h,w(i,:)+h*k3);
    w(i+1,:)=w(i,:)+(h/6)*(k1+2*k2+2*k3+k4);
end
return
