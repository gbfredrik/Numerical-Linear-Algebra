% Compute the derivative of the statevector
%
% S(t)=[ P(t) ; V(t) ] 
%
% where P is the position and V  is the velocity
%
function [ dS ] = SoccerODE( t , S )

% Extract position and velocity from state vector.
 P=S(1:3);  
 V=S(4:6);
 
% Compute acceleration vector

 A=BallAcceleration( t ,P , V);

% Collect derivative of state vector

 dS = [ V ; A ];


end

