function [c, ceq] = restricciones_artificiales_no_lineales(f, K, p_0, v_0, delta_t, m, g, Fmax, alpha)
    [~, p] = calcula_v_y_p(f(1:3 * K), K, delta_t, g, m, p_0, v_0);

    c = zeros(2 * K, 1);
    ceq = [];
    
    % Restricción de los puntos
    % f(1:3 * K) -> Variables reales
    % f(3 * K + 1:3 * K + K + 6) -> Variables artificiales
    for i = 1:K
        A1 = p_0(3) + i * delta_t * v_0(3) - delta_t^2 * i^2 / 2 * g;
        B1 = p_0(1) + i * delta_t * v_0(1);
        C1 = p_0(2) + i * delta_t * v_0(2);
        if A1^2 - alpha^2 * (B1^2 + C1^2) >= 0
            coef = 0;
        else
            coef = -1;
        end
        c(i) = alpha^2 * (p(3 * i + 1)^2 + p(3 * i + 2)^2) - p(3 * i + 3)^2 + coef * f(3 * K + 6 + i);
    end

    
    % Restricción de las fuerzas
    % f(1:3 * K) -> Variables reales
    for i = 0:K-1
        c(K + i + 1) = f(3 * i + 1)^2 + f(3 * i + 2)^2 + f(3 * i + 3)^2 - Fmax^2;
    end
end