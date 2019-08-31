function T=expandFEMgrid(T)

% T=expandFEMgrid(T)
% 
% Input:
%     T  : a triangulation with the original four basic fields
%          T.coordinates, T.elements, T.dirichlet, T.neumann
% Output:
%     T  : an expanded version of the triangulation with some new fields
%
% Last modified: February 18, 2015

T.baryc=(T.coordinates(:,T.elements(1,:))...
         +T.coordinates(:,T.elements(2,:))...
         +T.coordinates(:,T.elements(3,:)))/3;
if length(T.neumann)>0
    v=T.coordinates(:,T.neumann(2,:))...
        -T.coordinates(:,T.neumann(1,:));
    T.normal=[v(2,:);-v(1,:)];           % non-normalized normals
    T.midptNeu=0.5*T.coordinates(:,T.neumann(1,:))...
               +0.5*T.coordinates(:,T.neumann(2,:));
end
x12=T.coordinates(1,T.elements(2,:))-T.coordinates(1,T.elements(1,:));  % x(2)-x(1)
y12=T.coordinates(2,T.elements(2,:))-T.coordinates(2,T.elements(1,:));  % y(2)-y(1)
x13=T.coordinates(1,T.elements(3,:))-T.coordinates(1,T.elements(1,:));  % x(3)-x(1) 
y13=T.coordinates(2,T.elements(3,:))-T.coordinates(2,T.elements(1,:));  % y(3)-y(1)
T.detB=x12.*y13-x13.*y12;

% coefficients for stiffness matrix

T.c11=(x13.^2+y13.^2)./T.detB;
T.c22=(x12.^2+y12.^2)./T.detB;
T.c12=-(x12.*x13+y12.*y13)./T.detB;

% coefficients for gradients

T.g11=(y12-y13)./T.detB;
T.g12=y13./T.detB;
T.g13=-y12./T.detB;
T.g21=(x13-x12)./T.detB;
T.g22=-x13./T.detB;
T.g23=x12./T.detB;

return
