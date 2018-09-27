clc;
clear all;

n = 5;
t = [1:n]';
x = [1,1.6,1.4,2.2,2.0]';

% plot data
plot(t,x,'-o', 'LineWidth',1.5);
hold on;
xlabel('$$t$$','FontSize',18,'Interpreter','latex');
ylabel('$$x$$','FontSize',18,'Interpreter','latex');
xlim([0.5,5.5]);
ylim([0.75,2.5]);

% write data into matrix
S = [ones(n,1) t t.^2];

% SVD
[U,D,V] = svd(S)

% compute the coefficient
r = 3;
c = V(1:r,1:r)*D(1:r,1:r)^(-1)*U(1:n,1:r)'*x;

% find the smoothing trajectory
x_ = c(1)+c(2)*t+c(3)*t.^2;

% plot the smoothing trajectory
plot(t,x_, '--r', 'LineWidth', 2.5);
