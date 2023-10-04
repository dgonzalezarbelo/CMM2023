function init_va_no_lineal = inicializacion_aritificial_no_lineal(K, p_0, v_0, delta_t, g, alpha)
    init_va_no_lineal = zeros(K, 1);
    for i = 1:K
        A1 = p_0(3) + i * delta_t * v_0(3) - delta_t^2 * i^2 / 2 * g;
        B1 = p_0(1) + i * delta_t * v_0(1);
        C1 = p_0(2) + i * delta_t * v_0(2);
        init_va_no_lineal(i) = A1^2 - alpha^2 * (B1^2 + C1^2);
    end
end