clc
clear
close all
%
Tmax=320;
h=1e-5;
interval = 0:h:Tmax;
%
initial_conditions = [0.1 0 0.1];
alpha = 0.6;
beta = 0.5;
gamma = 1.0;
delta = 1.0/3.0;

y = nan(3,length(interval));
y(:,1) = initial_conditions;

y1 = initial_conditions(1);
y2 = initial_conditions(2);
y3 = initial_conditions(3);

F = [X1(y2); X2(y1, y2, y3, beta, delta); X3(y2, y3, alpha, gamma)];

for i = 2:length(interval)
    J = Jacobian(y2, y3, alpha, beta, gamma, delta);
    I = eye(size(J));
    k1 = ( eye(size(J)) - 0.5*h*J ) \ F;
    y(:,i) = [y1;y2;y3] + h*k1;

    y1 = y(1,i);
    y2 = y(2,i);
    y3 = y(3,i);

    F(1) = X1(y2);
    F(2) = X2(y1, y2, y3, beta, delta);
    F(3) = X3(y2, y3, alpha, gamma);
end

plot3(y(1,:), y(2,:), y(3,:));