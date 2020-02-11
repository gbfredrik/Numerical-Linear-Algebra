% Compute the acceleration vector A given the
% time t, position P, and velocity vector v
function [A] = BallAcceleration(t, P, V)
    % Parameters of the ball
    m=0.3656;  % Mass of the soccer ball.

    % Gravity force
    g=9.81;
    G=[ 0 ; 0 ; -g];
    Fg=m*G;

    % Drag force
    rho=1.2;
    alpha=0.0375;
    Cd=0.4;
    N=V/norm(V);
    Fd=-rho*alpha*norm(V)^2*Cd*N/2;

    % Magnus Force
    r=0.105;
    omega=[ 0 , 2*pi  , 12*pi]';
    Fm=4*rho*r^3*cross(omega , V)/3;

    % Total force
    F=Fg+Fd+Fm;

    % Now we know the force. Compute the accereration vector.
    A=F/m;
  
end