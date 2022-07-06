clc;
clear all;
load("mnist_train.mat");
N = 10000;
s = 28*28;
K = 20;
digits = digits(:, 1:N);
group = randi(K,1,N);
Z = zeros(s,K);
distance = zeros(K,N);
J_previous = 0;

for i=1:500
    for j=1:K
        I = find(group==j);
        avg = mean(digits(:,I),2); %Compute the average of the columns
        Z(:,j) = avg;
    end    
    for j=1:K
        distance(j,:) = sqrt(sum((digits - Z(:,j*ones(1,N))).^2));
    end
    [a, group] = min(distance);
    J = (1/N)*(norm(a)^2);
    if (abs(J - J_previous) > 1e-5 * J)
        J_previous = J;
    else
        break;
    end;
end;
for k=1:20
    subplot(4,5,k)
    imshow(reshape(Z(:,k), 28, 28));
end;


