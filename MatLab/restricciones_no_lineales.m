function [c, ceq] = restricciones_no_lineales(f, alpha, Fmax, K, delta_t, g, m)
    %restriccion_puntos = @(p_x,p_y,p_z,alpha) alpha*(p_x^2 + p_y^2) - p_z^2;
    %restriccion_fuerzas = @(f_x,f_y,f_z) f_x^2 + f_y^2 + f_z^2 - F_max^2;
    
    [~, p] = calcula_v_y_p(f, K, delta_t, g, m);

    c = zeros(2 * K, 1);
    ceq = [];

    % Restricción de los puntos
    for i = 1:K
        c(i) = alpha^2 * (p(3 * i + 1)^2 + p(3 * i + 2)^2) - p(3 * i + 3)^2;
    end

    % Restricción de las fuerzas
    for i = 0:K-1
        c(K + i + 1) = f(3 * i + 1)^2 + f(3 * i + 2)^2 + f(3 * i + 3)^2 - Fmax^2;
    end
end