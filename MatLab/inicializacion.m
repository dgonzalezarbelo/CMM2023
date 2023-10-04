function [sol_inicial, fval, exitflag, output] = inicializacion(K, p_0, v_0, p_K, v_K, delta_t, m, g, Fmax, alpha, options)

    % s(1:3 * K) -> Variables reales
    % s(3 * K + 1:3 * K + K + 6) -> Variables artificiales
    funcion = @(s) sum(s(3 * K + 1 : 3 * K + K + 6));

    [A, b, Aeq, beq] = restricciones_artificiales_lineales(K, p_0, v_0, p_K, v_K, delta_t, m, g);
    
    % Las 3 * K primeras variables (las reales) no tienen restricciones
    % Las K + 6 últilmas (las artificiales) tienen que ser no negativas
    lb = [repmat(-Inf, 3 * K, 1); zeros(K + 6, 1)];
    ub = [];

    init_va_no_lineal = inicializacion_aritificial_no_lineal(K, p_0, v_0, delta_t, g, alpha);
    sol_inicial_artificial = [zeros(3 * K, 1); abs(beq); abs(init_va_no_lineal)];

    [sol_inicial, fval, exitflag, output] = fmincon(funcion, sol_inicial_artificial, A, b, Aeq, beq, lb, ub, ...
            @(s) restricciones_artificiales_no_lineales(s, K, p_0, v_0, delta_t, m, g, Fmax, alpha), options);

end