%ExtractDigits: Picks out all digits of a certain type from the reference 
% or test set. 
%
% Usage example:
%
%  >>[ Ref9 ] = ExtractDigits( RefSet , RefAns , 9 );
%
% picks out all images that represent 9:s from the reference set. 
%
function [ TypeSubSet ] = ExtractDigits( DigitSet , DigitAns , Type )


 ind=find(DigitAns==Type);
 TypeSubSet=DigitSet(:,ind);

end