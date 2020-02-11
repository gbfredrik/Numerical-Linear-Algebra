%GaussNewton: Find the vector u0 that minimize the vector
%
%    ||f(u)||^2
%
% Usage:
%
%  >>u=GaussNewton( f , Jf , u0 );
%
% where f, and Jf 
%
%
%
function [ u ] = GaussNewton(f, Jf, u0)

   tol=10^-10;
   done=0;
   Uk=u0;k=0;
   while ~done
        k=k+1;
       %
       % Evaluate function and Jacobian 
       %
        Fk=f(Uk);
        Jk=Jf(Uk);
        
       %
       % Compute the Guass-Newton step Sk and update the
       % parameter vector Uk
       %
       Sk = -Jk \ Fk;
       
       Uk = Uk + Sk;
       %
       % Evaluate the stopping criterion. If the method has reached the  
       % desired tolerence then set the variable done=1.
       %
       if norm(Sk) < tol
           done = 1;
       end
   end

fprintf(1,'After k=%i steps we have norm(Sk)=%7.2e.\n',k,norm(Sk));
u=Uk;