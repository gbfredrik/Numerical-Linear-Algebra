
function [] = DisplayTrajectory(P0, V0)
% Compute and plot trajectory given the initial position and velocity
% 
%

 %P0=[0 0 0]';
 %V0=[25 0 6]';
 S0=[P0;V0];
 
% Add the event that the ball hits the ground to options. Also increase the
% tolerance in the ODE solver ALOT. This means we get the "true"
% trajectory; while FindFinalPosition() has more errors which complicate
% the equation solving.

 options = odeset('Events',@HitGroundEvent,'RelTol',10^-12);

% Solve the system of ODEs. Have to add a maximum time. 
 Tmax=100;
 [t,S]=ode45(@SoccerODE,[0:0.1:Tmax],S0,options);   
 
 % Collect position and velocity as a function of time.
 
 P=S(:,1:3)';
 V=S(:,4:6)';
 
 % For the 3D plot we add coordinate axes
 clf
 plot3(P(1,:),P(2,:),P(3,:))
 xlabel('Distance x(t)');zlabel('Height z(t)');
 ylabel('Distance y(t)')
 CurrentAxes=axis;CurrentAxes(5)=0;
 axis(CurrentAxes);
 grid on