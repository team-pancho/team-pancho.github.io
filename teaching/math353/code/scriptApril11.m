% Example of how to use the Heun method ODE solver

f = @(t,y) (6*t-3*t.*y)./(t.^2+1); 
t0=0;
y0=1;
yexact = @(t) 2-1./(t.^2+1).^(3/2);

tf=3;

[w,t]=heun(f,t0,tf,y0,6);
plot(t,w,'o-'),xlabel('t'),ylabel('y(t)')
hold on

tt=linspace(t0,tf,1000);   % points to plot the exact solution
plot(tt,yexact(tt),'r');
hold off                   % so that the next plot doesn't pile on this

errorHeun=max(abs(w-yexact(t))); 



    


