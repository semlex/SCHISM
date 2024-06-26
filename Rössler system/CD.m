clc
clear
close all
%
Tmax=350;
h=1e-3;
hl = h * 0.5;
interval = 0:h:Tmax;
%
initial_conditions = [1.6 0 -0.1];
a=0.2;
b=0.2;
c=5.7;

x = initial_conditions(1);
y = initial_conditions(2);
z = initial_conditions(3);

XValues = zeros(1, length(interval));
YValues = zeros(1, length(interval));
ZValues = zeros(1, length(interval));

for i = 1:length(interval)
    y_half_next = y + hl * Y(x, y, a);
    z_half_next = z + hl * Z(x, z, b, c);
    x_next = x + h * X(y_half_next, z_half_next);
    z_next = (z_half_next + hl * b) / (1 - hl * x_next + c * hl);
    y_next = (y_half_next + hl * x_next) / (1 - a*hl);
    x = x_next;
    y = y_next;
    z = z_next;
    XValues(i) = x;
    YValues(i) = y;
    ZValues(i) = z;
    
end
plot3(XValues, YValues, ZValues);