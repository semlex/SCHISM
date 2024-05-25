function J = Jacobian(x, z, a, c)
J = [0 -1 -1; 1 a 0; z 0 x - c];
end

