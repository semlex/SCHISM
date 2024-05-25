clc
clear
close all
%
Tmax=15;
h=1e-5;
interval = 0:h:Tmax;
%
initial_conditions = [1.15 0];
m=0;

Xvalue = initial_conditions(1);
Yvalue = initial_conditions(2);

XValues = zeros(1, length(interval));
YValues = zeros(1, length(interval));

for i = 1:length(interval)
    y_half_next = Yvalue + (h*0.5)*Y(Xvalue, Yvalue, m);
    x_next = Xvalue + h*X(y_half_next);
    y_next = (y_half_next - (h*0.5)*x_next)/(1-(h*0.5)*(1-x_next*x_next));
    Xvalue = x_next;
    Yvalue = y_next;
    XValues(i) = Xvalue;
    YValues(i) = Yvalue;
    
end
plot(XValues, YValues);
% plot(interval, XValues);
% hold on
% plot(interval, YValues);
