
function [Xk , k] = EqSolveNewtonBroy(f, B, Xk)
    tol=10^-10;
    
    Sk = 1;
    k = 0;
    while norm(Sk) > tol
        
        Xold = Xk;
        Sk = -B \ f(Xk);
        
        Xk = Xold + Sk;
        B = B + 1/(norm(Sk)^2)*(f(Xk)-f(Xold)-B*Sk)*Sk';
        
        error = norm(Sk)
        k = k+1;
    end
