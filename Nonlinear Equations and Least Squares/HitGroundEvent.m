% Event: Determine if the soccer ball has hit ground or not.
%
function [ value,isterminal,direction ] = HitGroundEvent( t, S )

 value = S(3);     % detect height = 0
 isterminal = 1;   % stop the integration
 direction = -1;   % negative direction

end

