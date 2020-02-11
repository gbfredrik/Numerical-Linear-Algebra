function [Xk , k] = EqSolveNewton(f, Jf, Xk)
    tol=10^-10;
    
    Sk = -Jf(Xk) \ f(Xk);
    k = 0;
    while norm(Sk) > tol
       
        Sk = -Jf(Xk) \ f(Xk);
        Xk = Xk + Sk;

        error = norm(Sk)
        k = k+1;
    end
