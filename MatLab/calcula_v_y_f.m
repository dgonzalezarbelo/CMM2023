function [v,f] = calcula_v_y_f(p, v_0, K, delta_t, m, g)
    v = zeros(3 * K,1);
    f = zeros(3 * K,1);

    v(1) = v_0(1);
    v(2) = v_0(2);
    v(3) = v_0(3);
    
    for i = 1:1:K
        % Cálculo de las v
        v(3 * i + 1) = 2 * (p(3 * i + 1) - p(3 * (i - 1) + 1)) / delta_t - v(3 * (i - 1) + 1);
        v(3 * i + 2) = 2 * (p(3 * i + 2) - p(3 * (i - 1) + 2)) / delta_t - v(3 * (i - 1) + 2);
        v(3 * i + 3) = 2 * (p(3 * i + 3) - p(3 * (i - 1) + 3)) / delta_t - v(3 * (i - 1) + 3);
        
        % Cálculo de las f
        f(3 * (i - 1) + 1) = m * ((v(3 * i + 1) - v(3 * (i - 1) + 1)) / delta_t);
        f(3 * (i - 1) + 2) = m * ((v(3 * i + 2) - v(3 * (i - 1) + 2)) / delta_t);
        f(3 * (i - 1) + 3) = m * ((v(3 * i + 3) - v(3 * (i - 1) + 3)) / delta_t + g);
    end
end