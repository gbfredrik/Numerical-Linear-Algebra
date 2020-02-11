%% 2.3
load Goose.mat;
colormap('gray');
figure(1);
imshow(GooseBW)

A=GooseBW;
[U,S,V]=svd(A);
p=50; 
Ap=U(:,1:p)*S(1:p,1:p)*V(:,1:p)';
figure(2);
imshow(Ap);

%% 2.4
figure(3);
semilogy(diag(S))
s = diag(S)
p=34; 
sum(s(2:p))/sum(s(2:end))

%% 3.1
z = [1 2];
r = 3;
m = 100;
tol = 10^-10;
[x_1, x_2] = CircleData(z, r, m, tol);

X =[x_1, x_2];
B = [X(:,1).^2 + X(:,2).^2, X(:,1), X(:,2), ones(m,1)];
[U,S,V] = svd(B);
u = V(:,4);
a = u(1);, b_1 = u(2);, b_2 = u(3);, c = u(4);
z_svd = [-b_1/(2*a) -b_2/(2*a)];
r_svd = sqrt((b_1^2+b_2^2 )/(4*a^2)-c/a);
[x_svd, y_svd] = CircleData(z_svd,r_svd,m,tol)
figure(3);
scatter(x_svd, y_svd)
title('Circle fitting svd');
%% 4.1
load DataSet.mat;
figure(4);
subplot(2,2,1);
DisplayDigit(RefSet(:,300)) 
title('Actual: 5');
subplot(2,2,2);
DisplayDigit(RefSet(:,7))
title('Actual: 3');
subplot(2,2,3);
DisplayDigit(RefSet(:,33)) 
title('Actual: 7');
subplot(2,2,4);
DisplayDigit(RefSet(:,1))
title('Actual: 6')

%% 4.2
MR = zeros(50,1)
for i = 1:50
    MR(i) = Classification(i, RefSet, RefAns, TestSet, TestAns);
end
figure;
plot(MR)
ylabel('Rate')
xlabel('No. of basis vectors')

function [MR] = Classification(k, RefSet, RefAns, TestSet, TestAns)
    TheSubSpaces = {};
    for Type=0:9
        Rj = ExtractDigits(RefSet, RefAns, Type);
        [Uj,Sj,Vj]=svd(Rj);
        TheSubSpaces{end+1} = Uj(:,1:k);
    end

    Type = zeros(length(TestSet),1);
    for i=1:length(TestSet)
        Type(i) = ClassifyDigit(TestSet(:,i), TheSubSpaces);
    end

    MR = ClassificationRate(Type, TestAns);
end





