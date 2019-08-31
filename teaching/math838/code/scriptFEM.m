%% SCRIPTS TO TEST THE p1-FEM

% FEM gets the solution of this one exact up to quadrature error. With c=0
% there's no error. With c>0 quadrature error becomes dominant.

c  = 0;
uD = @(x,y) x+2*y;
ux = @(x,y) 1+0*x;
uy = @(x,y) 2+0*y;
uN = @(x,y) [ux(x,y) ; uy(x,y)];
f  = @(x,y) c*uD(x,y);


load fourTriang
Tcollect={myT1 myT2 myT3 myT4};
for j=1:length(Tcollect)
    T=Tcollect{j};
    uh=P1FEMdiffusion(T,c,f,uD,uN);
    [errorL2(j),errorH1(j)]=computeFEMerror(T,uh,uD,ux,uy);
end

x=T.coordinates(1,:)'; y=T.coordinates(2,:)';
trisurf(T.elements',x,y,uh), shading flat
disp([errorL2,errorH1])


%% 

% Smooth solution

uD = @(x,y) y.*x.^2+3*y.^2.*x;
c=0;
f  = @(x,y) -2*y-6*x+c*uD(x,y);
ux = @(x,y) 2*x.*y+3*y.^2;
uy = @(x,y) x.^2+6*x.*y;
uN = @(x,y) [ux(x,y) ; uy(x,y)];

load fourTriang
Tcollect={myT1 myT2 myT3 myT4};
for j=1:length(Tcollect)
    T=Tcollect{j};
    uh=P1FEMdiffusion(T,c,f,uD,uN);
    [errorL2(j),errorH1(j)]=computeFEMerror(T,uh,uD,ux,uy);
end

h=[1 1/2 1/4 1/8];
loglog(h,errorL2,'-o'), hold on
loglog(h,errorH1,'-or')
loglog(h,h,'-r')
loglog(h,h.^2,'-')
legend('L^2 error', 'H^1 error','order 1', 'order 2')


%%

uD = @(x,y) sin(4*x-y);
c=1;
f  = @(x,y) 17*sin(4*x-y)+c*uD(x,y);
ux = @(x,y) 4*cos(4*x-y);
uy = @(x,y) -cos(4*x-y);
uN = @(x,y) [ux(x,y) ; uy(x,y)];

load fourTriang
Tcollect={myT1 myT2 myT3 myT4};
for j=1:length(Tcollect)
    T=Tcollect{j};
    uh=P1FEMdiffusion(T,c,f,uD,uN);
    [errorL2(j),errorH1(j)]=computeFEMerror(T,uh,uD,ux,uy);
end

h=[1 1/2 1/4 1/8];
loglog(h,errorL2,'-o'), hold on
loglog(h,errorH1,'-or')
loglog(h,h,'-r')
loglog(h,h.^2,'-')
legend('L^2 error', 'H^1 error','order 2', 'order 1')


