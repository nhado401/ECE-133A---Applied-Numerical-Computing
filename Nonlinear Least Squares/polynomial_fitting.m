clc;
clear all;
close all;
[t, y] = polyfit;
n = 4;
N = length(t);
error = 10^-4;
% Least squares method
A = fliplr(vander(t)); %Create Vandermonde matrix
A = A(:, 1:n);
coeff = A\y
% Gauss-Newton method
ort = coeff;
u = t;
x = [ort; u];
for k = 1:50
    van_mat = fliplr(vander(u));
    van_mat = van_mat(:, 1:n);
    r = [van_mat*ort - y; u - t];
    d = zeros(N, 1);
    for i = 2:n
        d = d+(i-1)*ort(i)*u.^(i-2);
    end
    A = [van_mat, diag(d); zeros(N, n), eye(N)];
    if (norm(A'*r) < error) 
        break; 
    end
    x = x - A\r;
    ort = x(1:n);
    u = x(n+1:n+N);
end
ort
h = scatter(t,y);
h.Annotation.LegendInformation.IconDisplayStyle = 'off';
hold on;
x = 0:0.01:1;
least_squares = coeff(1) + coeff(2)*x + coeff(3)*x.^2 + coeff(4)*x.^3;
plot(x,least_squares, 'm--');
hold on
ortho = ort(1) + ort(2)*x + ort(3)*x.^2 + ort(4)*x.^3;
plot(x, ortho, 'b');
grid on;
legend("Least Squares Fit", "Orthogonal Distance");
