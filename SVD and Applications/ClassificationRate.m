function [MR] = MisclassificationRate(approx, act)

trueApprox = 0;

for i=1:length(approx)
    if(approx(i)== act(i))
        trueApprox = trueApprox + 1;
    end
end

MR = trueApprox / length(approx);

