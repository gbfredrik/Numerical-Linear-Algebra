% Tana15 Computer Exercise 3
%% Exercise 2

f = @(x) [(x(1)+3)*(x(2)^3-7)+18; ...
            sin(x(2)*exp(x(1))-1)];
Jf = @(x) [(x(2)^3-7), 3*x(2)^2*(x(1)+3); ...
            exp(x(1))*x(2)*cos(1-exp(x(1))*x(2)), exp(x(1))*cos(1-exp(x(1))*x(2))];
X0 = [-0.5 1.4]';

[Xk, k] = EqSolveNewton(f, Jf, X0);

%% Exercise 3.1a
Vk = [22 0 5]';
P0 = [0 0 0]';
Pe = [23 5 0]';
Fk = @(Vk) (FindFinalPosition(P0,Vk) - Pe);
Jk = @(Vk) BallJacobian(P0, Vk);

[Vk, steps] = EqSolveNewton(Fk, Jk, Vk)
DisplayTrajectory(P0,Vk)
%% Exercise 3.1b
Vk = [22 0 5]';
Jk = eye(3,3);
Fk = @(Vk) (FindFinalPosition(P0,Vk) - Pe);

[Vk, steps] = EqSolveNewtonBroy(Fk, Jk, Vk)
DisplayTrajectory(P0,Vk)
%% Exercise 4.2
% Generate data points
z = [1 2];
r = 3;
m = 10;
tol = 10^-10;
[x, y] = CircleData(z, r, m, tol);

% Estimate circle
fr = @(z) sqrt((z(1)-x).^2 + (z(2)-y).^2) - z(3);

Jr = @(z) [1/2*((z(1)-x).^2 + (z(2)-y).^2).^(-1/2)*2.*(z(1)-x), ...
            1/2*(((z(1)-x).^2 + (z(2)-y).^2).^(-1/2)*2.*(z(2)-y)), ...
            -1*ones(m, 1)];
        
u0 = [1 3 1]';
uGN1 = GaussNewton(fr, Jr, u0);

u0 = [1 3 4]';
uGN2 = GaussNewton(fr, Jr, u0);

%u0 = [4 3 3]'; % Does not converge!
%uGN3 = GaussNewton(fr, Jr, u0);

figure(1)
hold on
scatter(x,y)
viscircles(uGN1(1:2)', uGN1(3));
hold off

figure(2)
hold on
scatter(x,y)
viscircles(uGN2(1:2)', uGN2(3));
hold off

%figure(3)
%hold on
%scatter(x,y)
%viscircles(uGN3(1:2)', uGN3(3));
%hold off