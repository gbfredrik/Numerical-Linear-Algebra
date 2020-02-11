%Hessenberg: Transform a square matrix B into Hessenberg form using
% Householder reflections. 
%
% Usage:
%   >> H = Hessenberg(B);
%
function [B]=Hessenberg(B);
  
  [N,M]=size(B);
  
  for i=1:N-1
    %
    % Select a Householder reflection such that H*B(k+1:N,1)=alpha*e1. 
    % This Householder reflection needs to be applied from the left
    % and from the right to the appropriate part of the matrix B.
    %
    %
    % Note: Even though the ApplyReflection subrouting is written to
    % apply the reflection from the left its possible to use the same
    % subroutine to apply the reflection from the right. How?
    %
    %x = zeros(size(B(:,i)));
    x = B(i+1:N,i);
    
    B(i+1:N,:) = ApplyReflection(B(i+1:N,:), x);
    
    B(:,i+1:N) = transpose(ApplyReflection(transpose(B(:,i+1:N)), x));
    
  end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% LOCAL SUBROUTINES 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%ApplyReflection: Compute the product H*A where H is a 
% Householder reflection matrix such that H*x=norm(x)*e1.
%
function [HA]=ApplyReflection(A,x)
    [m,n]=size(A);
    % 
    % Find the vector v so that H(v)*x=alpha*e1. 
    %
    e = zeros(min([m n]),1);
    e(1,1) = 1;
    alpha = -sign(x(1))*norm(x);
    
    v = x - alpha*e;
    
    beta = transpose(v)*v;
    %
    % Apply the reflection H to all the columns A(:,k) one at a time.
    %
    for j = 1:n
        gamma = transpose(v)*A(:,j);
        A(:,j) = A(:,j) - ((2*gamma)/beta) * v;
    end

    HA = A;
end


    

 
