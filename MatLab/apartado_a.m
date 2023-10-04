function apartado_a() 
    K = 35;
    delta_t = 1;
    g = 0.1;
    m = 10;
    Fmax = 11;
    p_0 = [50, 50, 100];
    v_0 = [-10; 0; -10];
    alpha = 0.5;
    gamma = 1;
    p_K = [0; 0; 0];
    v_K = [0; 0; 0];
    options = optimoptions('fmincon', 'MaxFunctionEvaluations', 100000, 'MaxIterations', 10000);

    [sol_inicial, fval, exitflag, output] = inicializacion(K, p_0, v_0, p_K, v_K, delta_t, m, g, Fmax, alpha, options);

    % Nos quedamos solo con las variables reales, las artificiales ya no
    % hacen falta
    sol_inicial = sol_inicial(1:3 * K);

    [f,consumo, exitflag, output] = optimizacion(sol_inicial, K, p_0, v_0, p_K, v_K, delta_t, m, g, Fmax, alpha, gamma, options);

    representacion_trayectoria(f, K, delta_t, g, m, consumo);
end