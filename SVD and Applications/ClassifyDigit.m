function [Type] = ClassifyDigit(S, TheSubSpaces)

d_previous = DistanceFromSubspace(cell2mat(TheSubSpaces(1)), S);  
Type = 0;

for i = 2:10 
    d = DistanceFromSubspace(cell2mat(TheSubSpaces(i)), S);
    if(d < d_previous)
        Type = i-1;
        d_previous = d;
    end
end
end