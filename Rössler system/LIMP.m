clc
clear
close all

%
Tmax=350;
h=1e-3;
interval = 0:h:Tmax;
%
initial_conditions = [1.6 0.0 -0.1];
a=0.2;
b=0.2;
c=5.7;

y = nan(3,length(interval));
y(:,1) = initial_conditions;

y1 = initial_conditions(1);
y2 = initial_conditions(2);
y3 = initial_conditions(3);

F = [X(y2, y3); Y(y1, y2, a); Z(y1, y3, b, c)];

for i = 2:length(interval)
    J = Jacobian(y1, y3, a, c);
    I = eye(size(J));
    k1 = ( eye(size(J)) - 0.5*h*J ) \ F;
    y(:,i) = [y1;y2;y3] + h*k1;

    y1 = y(1,i);
    y2 = y(2,i);
    y3 = y(3,i);

    F(1) = X(y2, y3);
    F(2) = Y(y1,y2,a);
    F(3) = Z(y1, y3, b, c);
end

plot3(y(1,:), y(2,:), y(3,:));