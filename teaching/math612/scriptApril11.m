n=1000;
e = ones(n,1);
A = spdiags([e -2*e e], -1:1, n, n)*(n+1)^2;
tt=linspace(0,1,n+2);tt([1 end])=[];tt=tt';
x = tt.*(1-tt); 
b = A*x;

D = diag(diag(A));
U = -triu(A,1);
L = -tril(A,-1);

xn= 0*randn(n,1)+0.1*randn(n,1);
%plot(xn),pause
for i=1:200000
    xn=D\(b+L*xn+U*xn);
    %plot(xn),pause(0.01)
end
plot(xn), hold on
plot(x,'r')