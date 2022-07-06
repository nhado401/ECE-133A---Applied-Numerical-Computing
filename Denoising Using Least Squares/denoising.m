clc;
clear all;
xcor = lsdenoising;
subplot(2,2,1);
plot(xcor);
title("Noisy Signal");
lambda = [1, 100, 10000];
D = sparse(999,1000);
D(:,1:999) = -speye(999);
D(:,2:1000) = D(:,2:1000) + speye(999);
for k=1:3
    xhat = (speye(1000) + lambda(k)*D'*D) \ xcor;
    subplot(2,2,k+1);
    plot(xhat);
    title("\lambda" + "=" + lambda(k));
end
