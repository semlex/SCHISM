clc
clear
close all
%
Tmax=320;
h=1e-5;
hl = h * 0.5;
interval = 0:h:Tmax;
%
initial_conditions = [0.1 0 0.1];
alpha = 0.6;
beta = 0.5;
gamma = 1;
delta = 1/3;

x1 = initial_conditions(1);
x2 = initial_conditions(2);
x3 = initial_conditions(3);

X1Values = zeros(1, length(interval));
X2Values = zeros(1, length(interval));
X3Values = zeros(1, length(interval));

for i = 1:length(interval)
    x1_half_next = x1 + hl * X1(x2);
    x2_half_next = (x2-hl*delta*x1_half_next) / (1+hl*beta*(x3*x3 - 1));
    x3_half_next = (x3-hl*x2_half_next) / (1+hl*(alpha-x2_half_next));
    x3_next = x3 + h*X3(x2_half_next, x3_half_next, alpha, gamma);
    x2_next = x2 + h*X2(x1_half_next, x2_half_next, x3_half_next, beta, delta);
    x1_next = x1 + h*X1(x2_half_next);
    x1 = x1_next;
    x2 = x2_next;
    x3 = x3_next;
    X1Values(i) = x1;
    X2Values(i) = x2;
    X3Values(i) = x3;
    
end
plot3(X1Values, X2Values, X3Values);