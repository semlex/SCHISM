function J = Jacobian(x, m)
J = [0 1; -2*m*x m - m*x*x];
end

