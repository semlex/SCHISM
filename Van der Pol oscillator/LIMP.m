clc
clear
close all

%
Tmax=15;
h=1e-4;
interval = 0:h:Tmax;
%
initial_conditions = [1.15 0];
m=4;

y = nan(2,length(interval));
y(:,1) = initial_conditions;

y1 = initial_conditions(1);
y2 = initial_conditions(2);

F = [X(y2); Y(y1, y2, m)];

for i = 2:length(interval)
    J = Jacobian(y1, m);
    I = eye(size(J));
    k1 = ( eye(size(J)) - 0.5*h*J ) \ F;
    y(:,i) = [y1;y2] + h*k1;

    y1 = y(1,i);
    y2 = y(2,i);

    F(1) = X(y2);
    F(2) = Y(y1,y2,m);
end

plot(y(1,:), y(2,:));