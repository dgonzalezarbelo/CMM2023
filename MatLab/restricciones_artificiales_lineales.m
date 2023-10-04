function [A, b, Aeq, beq] = restricciones_artificiales_lineales(K, p_0, v_0, p_K, v_K, delta_t, m, g)
    % Todas las ecuaciones son de igualdad, ninguna desigualdad.
    % La matriz va a tener 6 filas (restricción de punto final [3
    % coordenadas] y restricción de velocidad final [3 coordenadas]) y 
    % 3 * K + 6 columnas (K fuerzas [3 coordenadas] y 6 variables
    % artificiales, una por ecuación).
    
    [~, ~, Aeq, beq] = restricciones_lineales(K, p_0, v_0, p_K, v_K, delta_t, m, g);
    A_artificial_lineal = eye(6);
    
    %A = blkdiag(zeros(3 * K), -1 * eye(K + 6));
    %b = zeros(3 * K + K + 6, 1);
    A = [];
    b = [];

    for i = 1:6
        if beq(i) < 0
            A_artificial_lineal(i, i) = -1;
        end
    end
    Aeq = [Aeq, A_artificial_lineal, zeros(6, K)];
end