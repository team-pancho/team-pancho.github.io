% basicFEMgrid - Last modified: February 18, 2015

% This script assumes that you have created a mesh with the PDE Toolbox and
% exported the decomposed geometry and mesh. (See documentation for more
% instructions.)

T.coordinates=p;       % Nodes
T.elements=t(1:3,:);   % Connectivity 

% Reorientation

j = find(e(6,:)==0);   % edges that have the exterior on the left
e([1 2],j)=e([2 1],j);

% Neumann edges

NeuList=find(b(2,e(5,:))==0);
T.neumann=e([1 2],NeuList);

% Dirichlet edges

DirList=find(b(2,e(5,:))~=0);
T.dirichlet=e([1 2],DirList);



