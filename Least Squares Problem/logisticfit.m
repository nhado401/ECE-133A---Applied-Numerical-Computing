clc;
clear all;
[t, y] = logistic_fit;
n = size(t,1);
A = ones(n,2);
b = zeros(n,1);
for k=1:n
    A(k,1) = t(k);
    b(k,1) = log(y(k)/(1-y(k)));
end
x = lsqr(A,b)
scatter(t,y);
hold on;
a = -1:0.1:5;
f = (exp(x(1)*a+x(2)))./(1 + exp(x(1)*a+x(2)));
plot(a,f);
xlabel("x");
ylabel("f");
    
