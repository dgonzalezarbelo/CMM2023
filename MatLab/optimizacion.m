function [f,consumo, exitflag, output] = optimizacion(sol_inicial, K, p_0, v_0, p_K, v_K, delta_t, m, g, Fmax, alpha, gamma, options)
    
    fun_objetivo = @(x) gamma * delta_t * sum(reshape(vecnorm(reshape(x, 3, []), 2, 1), [], 1));
    
    [A, b, Aeq, beq] = restricciones_lineales(K, p_0, v_0, p_K, v_K, delta_t, m, g);
    
    f = sol_inicial;
    maxIteraciones = 5;
    for i = 1:maxIteraciones
        [f, consumo, exitflag, output] = fmincon(fun_objetivo, sol_inicial, A, b, Aeq, beq, [], [], @(s) restricciones_no_lineales(s, alpha, Fmax, K, delta_t, g, m), options);
    end
    
end