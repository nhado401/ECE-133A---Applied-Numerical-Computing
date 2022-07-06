clc;
clear all;
A = [1,1;0,0.95];
b = [0;0.1];
C = [1,1;0,0.80];
d = [0;0.2];
N = 20;
F = zeros(2,N);
G = zeros(2,N);
%Create F and G:
for k=1:N
    F(:,k) = A^(N-k)*b;
    G(:,k) = C^(N-k)*d;
end
J = [ F(1,:), -G(1,:); F(2,:), zeros(1,N); zeros(1,N), G(2,:)];
k = [ 1; 0; 0];
%Least Norm Solution
x = J' * ((J*J') \ k);
u = x(1:N);
v = x(N+1:2*N);
 
%Initialize and plot 2 vehicles
s = zeros(2,N+1); 
p = zeros(2,N+1); 
p(1,1) = 1;
for t=1:N
    s(:,t+1) = A*s(:,t) + b*u(t);
    p(:,t+1) = C*p(:,t) + d*v(t);
end
plot(0:N, s(1,:), '-', 0:N, p(1,:), '-*');
grid on;
xlabel("Time");
ylabel("Position");
legend("Vehicle 1", "Vehicle 2");
