clc;
clear all;
[u,v] = circlefit;
plot(u, v, 'o');
axis equal
n = size(u,1);
A = ones(n,3);
b = zeros(n,1);
for i=1:n
    A(i,1) = -2*u(i);
    A(i,2) = -2*v(i);
    b(i,1) = -(u(i).^2) - (v(i).^2); 
end
x = lsqr(A,b);
R = sqrt((x(1).^2) + (x(2).^2) - x(3));
fprintf("The value of Uc is: %f\n", x(1));
fprintf("The value of Vc is: %f\n", x(2));
fprintf("The value of R is: %f\n", R);
uc = x(1);
vc = x(2);
t = linspace(0, 2*pi, 1000);
plot(u, v, 'o', R * cos(t) + uc, R * sin(t) + vc, '-');
axis equal;
grid on;
