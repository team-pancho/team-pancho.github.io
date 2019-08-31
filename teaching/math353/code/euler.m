function [w,t]=euler(f,tinit,tfinal,yinit,n)

% [w,t]=euler(f,tinit,tfinal,yinit,n)
% Input:
%     f      : function of two variables (second is a d-vector)
%     tinit  : initial time
%     tfinal : final time
%     yinit  : initial value (at t=tinit)
%     n      : number of time-steps
% Output:
%     w      : n+1 x d matrix w_i(i,:) ~= y(t_i) 
%              (Eulers's method for y'=f(t,y), y(tinit)=yinit
%     t      : vector with n+1 components (times)

t=linspace(tinit,tfinal,n+1);
h=(tfinal-tinit)/n;
w=zeros(n+1,length(yinit));   % (optional) creates room to store the solution
w(1,:)=yinit;           % initial value
for i=1:n
    k1=f(t(i),w(i,:));
    w(i+1,:)=w(i,:)+h*k1;
end
return

