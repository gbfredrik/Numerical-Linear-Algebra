%BallJacobian: Compute the Jacobian matrix corresponding to the
% FindFinalPosition.m function file.
%
function [J] = BallJacobian(P0 , V0 , h)
    if nargin<3
        h=10^-4;
    end

    J=zeros(3,3); I=eye(3);
    for j=1:3
        tmp=FindFinalPosition(P0, V0+I(:,j)*h);
        tmp= tmp - FindFinalPosition(P0, V0 -I(:,j)*h);
        tmp=tmp/2/h;
        J(:,j)=tmp(1:3);
    end
end

