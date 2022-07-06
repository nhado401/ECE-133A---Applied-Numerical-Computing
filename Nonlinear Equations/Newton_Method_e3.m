clc;
clear all;
close all;
p0 = 0.5; %initial condition
N = 100; %maximum number of iteration
k = 1;
error = 10^-8; %value to terminate iteration
syms 'x';
f(x) = x^3 - 6*x^2 + 12*x - 8; %function
d_f = diff(f); %derivative
iter = [];
root = [];
while k < N && abs(f(p0)) > error
   p = p0 - (f(p0)/d_f(p0)); %calculate the value
   iter = [iter, k];
   root = [root, round(p,4)];
   k = k + 1;
   p0 = p; %update the value
end
result = round(vpa(p0),4) %root
figure(1)
scatter(iter,root,'LineWidth',1);
hold on
plot(iter,root,'LineWidth',1);
xlabel("k");
ylabel("f(x(k))");
ylim([1,2.2]);
title("Speed of Convergence");
grid on;
t = 0:0.1:4;
figure(2)
f_t = t.^3 - 6*t.^2 + 10*t;
plot(t,f_t,'LineWidth',1);
hold on
f_hat = -2*t + 8;
plot(t,f_hat,'LineWidth',1);
grid on;
