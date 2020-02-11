%% 2.1
A = [2 -1 0 0 0 0; -1 3 -1 0 0 0; 0 -1 4 -1 0 0; 0 0 -1 5 -1 0; 0 0 0 -1 6 -1; 0 0 0 0 -1 7]

[V1, D1] = eig(A)
%% 2.2
A = [2 -1 0 0 0 0; -1 3 -1 0 0 0; 0 -1 4 -1 0 0; 0 0 -1 5 -1 0; 0 0 0 -1 6 -1; 0 0 0 0 -1 7];
x0 = [1;1;1;1;1;1];
N = 30;
[x,rho] = EigPower(A,x0,N);

eigV = eig(A);
error = eigV(end) - rho(end)
lambda1 = rho(end)

rho(3)
rho(4)
rho(5)

gammaApprox3 = (abs(rho(3) - eigV(end))) / (abs(rho(2) - eigV(end))) %%%%% Kontrollera index för rho()
gammaApprox4 = (abs(rho(4) - eigV(end))) / (abs(rho(3) - eigV(end)))
gammaApprox5 = (abs(rho(5) - eigV(end))) / (abs(rho(4) - eigV(end)))

gammaK1 = (abs(eigV(end-1)) / abs(eigV(end)))^2

kappa2 = norm(V1)*norm(inv(V1))
error2 = kappa2*norm(A*x - rho(30)*x)

%% 2.3
lambda4 = 4;
s = 4;
N = 3;
I = eye(size(A));

[x2,rhoB] = InversePower(A, x0, N, s);

gamma = (abs(eigV(3) - s) / abs(eigV(2) - s))^2
gammaApprox = (abs(rhoB(3) - eigV(3))) / (abs(rhoB(2) - eigV(3)))

%% 3.1
B = [1 2 3 4; 2 2 -1 -4; 3 -1 3 1; 4 -4 1 4];

B1 = B;
N = 10;
for k=1:N
    [Q, R] = qr(B1);
    B1 = R*Q;
end

eDiag = diag(B1)
eAct = eig(B)
error = eAct(2) - eDiag(4)

%% 3.2
B = [1 2 3 4; 2 2 -1 -4; 3 -1 3 1; 4 -4 1 4];

B1 = B;
N = 3;
for k=1:N
    s = B1(4, 4);
    [Q, R] = qr(B1-s*eye(4));
    B1 = R*Q + s*eye(4);
end

eDiag = diag(B1)
eAct = eig(B)
error = eAct(3) - eDiag(4)

eig(B1(1:3, 1:3))

%% 3.3
B = [1 2 3 4; 2 2 -1 -4; 3 -1 3 1; 4 -4 1 4];
heisse = hess(B);
eAct = eig(B)

H = Hessenberg(B);
eHei = eig(H)

%% 3.5
B = [1 2 3 4; 2 2 -1 -4; 3 -1 3 1; 4 -4 1 4];
D = HessEigQR(B)

eig(B)

%% 4.2

A = [10 -35 50 -24; 1 0 0 0; 0 1 0 0; 0 0 1 0];
eig(A)


%% 5.1
A = [1/3 0 1/3 0 1/2 0; 1/3 0 1/3 0 0 0; 0 1 0 1/2 0 1/3; 0 0 1/3 0 0 1/3; 1/3 0 0 0 0 1/3; 0 0 0 1/2 1/2 0]
[V,D] = eig(A)
ev = abs(diag(D));

rank = V(:,1) / sum(V(:,1))