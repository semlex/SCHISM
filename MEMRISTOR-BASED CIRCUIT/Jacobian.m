function J = Jacobian(x2, x3, alpha, beta, gamma, delta)
J = [0, 1, 0; -delta, -beta*x3*x3 + beta, -2*beta*x2*x3; 0, -1 + gamma*x3, -alpha + gamma * x2];
end

