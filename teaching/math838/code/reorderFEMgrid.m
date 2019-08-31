function T=reorderFEMgrid(T)

% T=reorderFEMgrid(T)
%
% Input:
%     T   : basic mesh data structure with fields
%           .coordinates, .elements, .dirichlet, .neumann
% Output:
%     T   : same triangulation
%           REORDERED so that longest edge is the first one
%
% Last modified: February 18, 2015

firstnode =T.coordinates(:,T.elements(1,:));
secondnode=T.coordinates(:,T.elements(2,:));
thirdnode =T.coordinates(:,T.elements(3,:));   
lengths   =zeros(size(T.elements));
lengths(1,:)=sum((secondnode-firstnode).^2,1);
lengths(2,:)=sum((thirdnode-secondnode).^2,1);
lengths(3,:)=sum((firstnode-thirdnode).^2,1);
lengths     =sqrt(lengths);
[which,where]=max(lengths,[],1);
itssecond = find(where==2);
itsthird  = find(where==3);  
T.elements(:,itssecond)=T.elements([2 3 1],itssecond);
T.elements(:,itsthird)=T.elements([3 1 2],itsthird);

return