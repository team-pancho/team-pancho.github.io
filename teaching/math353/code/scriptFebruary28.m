% This is not a function. This a script
% There's no input and no output. 

p = @(x) 8./(x+2);   % looking to solve r=p(r)
exact = 2;                   % exact fixed point

[fix,hist]=fixedpoint(p,0.1,40,1e-10);  % fixed point iteration
err=abs(hist-exact)                     % errors
err(2:end)./err(1:end-1)                % trend of the errors 

% It's a good idea to add comments to remember what you did 
