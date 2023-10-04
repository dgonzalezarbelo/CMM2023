function [A, b, Aeq, beq] = restricciones_lineales(K, p_0, v_0, p_K, v_K, delta_t, m, g)
    A = [];
    b = [];
    Aeq = zeros(6, 3 * K);
    beq = zeros(6, 1);
    
    % Ecuaciones para la restricción de v_K
    for i = 0:K-1
        Aeq(1, 3 * i + 1) = delta_t / m;
        Aeq(2, 3 * i + 2) = delta_t / m;
        Aeq(3, 3 * i + 3) = delta_t / m; 
    end

    % Ecuaciones para la restricción de p_K
    for i = 0:K-1
        Aeq(4, 3 * i + 1) = (K - i - 1 / 2) * delta_t^2 / m;
        Aeq(5, 3 * i + 2) = (K - i - 1 / 2) * delta_t^2 / m;
        Aeq(6, 3 * i + 3) = (K - i - 1 / 2) * delta_t^2 / m; 
    end
    
    % Términos independientes para la restricción de v_K
    beq(1) = v_K(1) - v_0(1);
    beq(2) = v_K(2) - v_0(2);
    beq(3) = v_K(3) - v_0(3) + K * delta_t * g;

    % Términos independientes para la restricción de p_K
    beq(4) = p_K(1) - p_0(1) - K * delta_t * v_0(1);
    beq(5) = p_K(2) - p_0(2) - K * delta_t * v_0(2);
    beq(6) = p_K(3) - p_0(3) - K * delta_t * v_0(3) + delta_t^2 * K^2 / 2 * g;
    
end