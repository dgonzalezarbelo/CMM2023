function [x,y,z] = de_p_a_xyz(p, K)
    x = zeros(K + 1, 0);
    y = zeros(K + 1, 0);
    z = zeros(K + 1, 0);
    for i = 1:K + 1
        x(i) = p(3 * (i - 1) + 1);
        y(i) = p(3 * (i - 1) + 2);
        z(i) = p(3 * (i - 1) + 3);
    end
end