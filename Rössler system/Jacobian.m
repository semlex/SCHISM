function J = Jacobian(x, z, a, c)
J = [0 -1.0 -1.0; 1.0 a 0.0; z 0.0 x-c];
end

