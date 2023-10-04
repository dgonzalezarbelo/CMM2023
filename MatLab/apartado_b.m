function apartado_b()
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
    options = optimoptions('fmincon', 'MaxIterations', 10000, 'MaxFunctionEvaluations', 60000, ...
        'StepTolerance',1e-15);
    busca_K_minimo(K, p_0, v_0, p_K, v_K, delta_t, m, g, Fmax, alpha, options)
end