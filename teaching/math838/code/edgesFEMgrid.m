function T=edgesFEMgrid(T)

% T=edgesFEMgrid(T)
% Input: 
%     T    : basic or expanded triangulation data structure
% Output:
%     T    : fields added 
%            T.edges, T.edgebyelt
%
% Last modified: February 25, 2015

N=size(T.coordinates,2);
Ndir = size(T.dirichlet,2);
Nneu = size(T.neumann,2);

edges = sparse(T.elements,T.elements([2 3 1],:),1); % all edges
edges = edges+edges';
edges(find(edges==1))=0;   % eliminate bd edges
[i,j] = find(edges);
Nint  = sum(i<j);
edges = sparse(i,j,i<j);   % lower triangular

listInt=1:Nint;
listDir=1+Nint:Nint+Ndir;
listNeu=1+Nint+Ndir:Nint+Ndir+Nneu;

T.edges=[];
if Nint>0
    [i,j]=find(edges);
    T.edges=[T.edges [i'; j'; zeros(1,Nint)]];
    edges=sparse(i,j,listInt,N,N);
    edges=edges-edges';
end
if Ndir>0
    T.edges=[T.edges [T.dirichlet ; ones(1,Ndir)]];
    edges=edges+...
          sparse(T.dirichlet(1,:),T.dirichlet(2,:),listDir,N,N);
end
if Nneu>0
    T.edges=[T.edges [T.neumann; 2*ones(1,Nneu)]];
    edges=edges+...
          sparse(T.neumann(1,:),T.neumann(2,:),listNeu,N,N);
end
T.edgebyelt=...
    [full(edges(sub2ind([N,N],T.elements(1,:),T.elements(2,:))));...
     full(edges(sub2ind([N,N],T.elements(2,:),T.elements(3,:))));...
     full(edges(sub2ind([N,N],T.elements(3,:),T.elements(1,:))))];
 
return

