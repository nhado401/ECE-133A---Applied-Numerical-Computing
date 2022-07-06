clc;
clear all;
close all;
p0 = [1,0.5]; %initial condition
N = 10; %maximum number of iteration
k = 1;
error = 10^-4; %value to terminate iteration
syms 'x1';
syms 'x2';
f1(x1,x2) = (x1-1).^2 + 2*(x2-1).^2 - 1;
f2(x1,x2) = 3*(x1+x2-2).^2 + (x1-x2-1).^2 - 2;
H(x1,x2) = [2*(x1-1), 4*(x2-1); 6*(x1+x2-2)+2*(x1-x2-1), 6*(x1+x2-2)-2*(x1-x2-1)];
g = vpa(round([f1(p0(1),p0(2)), f2(p0(1),p0(2))],4));
while k < N && abs(round(f1(p0(1),p0(2)),4) - round(f2(p0(1),p0(2)),4)) > error
    v = vpa(round(linsolve(H(p0(1),p0(2)),-g'),4));
    p0 = p0 + v';
    g = vpa(round([f1(p0(1),p0(2)), f2(p0(1),p0(2))],4));
    k = k + 1;
end
p0,k
ezplot('(x1-1).^2 + 2*(x2-1).^2 - 1', [-0.5 2.5 -0.5 2.5]);
hold on
ezplot('3*(x1+x2-2).^2 + (x1-x2-1).^2 - 2', [-0.5 2.5 -0.5 2.5]);
title("");
grid on;
axis equal
