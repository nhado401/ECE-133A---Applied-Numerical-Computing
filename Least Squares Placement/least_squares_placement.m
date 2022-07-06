clc;
clear all;
E = [ 1, 3; 1, 4; 1, 7; 2, 3; 2, 5; 2, 8; 2, 9; 3, 4; 3, 5; 4, 6; 5, 6; 6, 9; 6, 10 ];
m = size(E, 1);
n = 10;
B = zeros(n, m);

%Create incidence matrix B
for k = 1:m        
    B(E(k,1), k) = 1;
    B(E(k,2), k) = -1;
end;

%Split the matrix into 2 different parts as in question b
fixed_position = 7:n;
fixed_location = [0,0; 0,1; 1,1; 1,0];
position = 1:6;
B1 = B(position,1:m);
B2 = B(fixed_position,1:m);

%Find the unknown locations
x = -B1'\(B2'*fixed_location);
total_position = [x' fixed_location']

%Plot the data points
scatter(total_position(1,:), total_position(2,:),'r');
hold on;

%Connect all the data points as in E
for i=1:m
    plot([total_position(1,E(i,1)),total_position(1,E(i,2))], [total_position(2,E(i,1)),total_position(2,E(i,2))]);
    hold on;
end
grid on;
