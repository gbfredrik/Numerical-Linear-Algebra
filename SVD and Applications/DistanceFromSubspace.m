function [d] = DistanceFromSubspace(Uj, TestDigit)

d = norm(TestDigit - Uj*(Uj'*TestDigit));

end