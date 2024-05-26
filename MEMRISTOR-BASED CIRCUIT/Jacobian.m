function J = Jacobian(x2, x3, alpha, beta, delta)
J = [0, 1, 0; -delta, -beta*x3*x3 + beta, -2*beta*x2*x3; 0, -1 + x3, -alpha + x2];
end

