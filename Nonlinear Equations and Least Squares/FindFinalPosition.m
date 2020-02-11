% Compute the final position Pe given initial position
% and initial velocity.
%
%
function [ Pe , Ve ] = FindFinalPosition(P0 , V0)
    % Create state vector
    S0=[P0;V0];
 
    % Add the event that the ball hits the ground to options
    options = odeset('Events',@HitGroundEvent,'RelTol',1e-9);

    % Solve the system of ODEs. Have to add a maximum time. 
    Tmax=100;
    [t,S]=ode45(@SoccerODE, [0:0.1:Tmax], S0, options);   
 
    % Collect position and velocity at the final time.
 	Pe=S(end,1:3)';
    Ve=S(end,4:6)';
end

