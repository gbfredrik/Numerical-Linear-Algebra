
A = [1/3 0 1/3 0 1/2 0; 1/3 0 1/3 0 0 0; 0 1 0 1/2 0 1/3;
     0 0 1/3 0 0 1/3; 1/3 0 0 0 0 1/3; 0 0 0 1/2 1/2 0];

%A = [0 0 1 1/2; 1/3 0 0 0; 1/3 1/2 0 1/2; 1/3 1/2 0 0];

[V, D] = eig(A);
ev = abs(diag(D)); % OK

rank = V(:,1) / sum(V(:,1));
