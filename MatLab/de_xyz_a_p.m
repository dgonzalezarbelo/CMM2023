function p = de_xyz_a_p(x,y,z,K)
    p = zeros(3*(K+1),1);
    for i = 0:1:K
        p(3*i + 1) = x(i + 1);
        p(3*i + 2) = y(i + 1);
        p(3*i + 3) = z(i + 1);
    end
end