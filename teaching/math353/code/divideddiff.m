function coeff=divideddiff(x,y)

% c=divideddiff(x,y)
%
% Input:
%     x,y : vectors of m components (interpolation points)
% Output:
%     c   : vector with the corresponding divided differences

m=length(x);
D=zeros(m,m);
D(:,1)=y';   
for j=1:m-1
    for i=1:m-j
        D(i,j+1)=(D(i+1,j)-D(i,j))/(x(i+j)-x(i));
    end
end
coeff=D(1,:);
return

% alternative version of i-loop
%    i=1:m-1;    % no loop
%    D(i,j+1)=(D(i+1,j)-D(i,j))./(x(i+j)-x(i));
