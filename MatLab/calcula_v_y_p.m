function [v, p] = calcula_v_y_p(f, K, delta_t, g, m, p_0, v_0)
    % v_k+1 = (delta_t / m) * f_k - delta_t * g * e_3
    v = zeros(3 * (K + 1), 1);
    p = zeros(3 * (K + 1), 1);
    
    % Valores iniciales
    p(1) = p_0(1);
    p(2) = p_0(2);
    p(3) = p_0(3);
    v(1) = v_0(1);
    v(2) = v_0(2);
    v(3) = v_0(3);

    for i = 1:1:K
        % Cálculo de las v
        v(3 * i + 1) = v(3 * (i - 1) + 1) + (delta_t / m) * f(3 * (i - 1) + 1);
        v(3 * i + 2) = v(3 * (i - 1) + 2) + (delta_t / m) * f(3 * (i - 1) + 2);
        v(3 * i + 3) = v(3 * (i - 1) + 3) + (delta_t / m) * f(3 * (i - 1) + 3) - delta_t * g;

        % Cálculo de las p
        p(3 * i + 1) = p(3 * (i - 1) + 1) + delta_t * (v(3 * i + 1) + v(3 * (i - 1) + 1)) / 2;
        p(3 * i + 2) = p(3 * (i - 1) + 2) + delta_t * (v(3 * i + 2) + v(3 * (i - 1) + 2)) / 2;
        p(3 * i + 3) = p(3 * (i - 1) + 3) + delta_t * (v(3 * i + 3) + v(3 * (i - 1) + 3)) / 2;
    end
end