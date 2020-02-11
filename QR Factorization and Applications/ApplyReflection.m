%ApplyReflection: Compute the product H*A where H is the 
% Householder reflection matrix that creates zeros elememts
% below the diagonal in the first column. 
%
function [HA]=ApplyReflection(A);
  
% Select the vector x to used for constructing the reflection
    
  x=A(:,1); 

 %
 % Find the vector v so that H(v)*x=alpha*e1. 
 %

 v=
 
 %
 % Compute the product  H*A. Treat one column at a time, i.e. 
 % (HA)(:,k)=H*A(:,k).
 %
   HA=zeros(size(A));
    
