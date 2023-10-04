function A = construye_matriz_sistema_lineal(K, f, delta_t, m)
    % v_j = v_0 + 1/10 * sum_{i=0}^{j-1}f_i - j/10 * e_3
    % p_j = p_0 + j*v_0 - k^2/20 * e_3 + 1/10 * sum_{i=0}^{j-1}(j-i-1/2)f_i
    A = zeros(6, 3 * K);
    
    % Cálculo de los v_j
    for i = 0:1:K-1
        A(1, 3 * i + 1) = (K - i - 1 / 2) * f(3 * i + 1) * delta_t / m;
        A(2, 3 * i + 2) = (K - i - 1 / 2) * f(3 * i + 2) * delta_t / m;
        A(3, 3 * i + 3) = (K - i - 1 / 2) * f(3 * i + 3) * delta_t / m; 
    end
    % Cálculo de los p_j
    for i = 0:1:K-1
        A(4, 3 * i + 1) = (K - i - 1 / 2) * f(3 * i + 1) * delta_t^2 / m;
        A(5, 3 * i + 2) = (K - i - 1 / 2) * f(3 * i + 2) * delta_t^2 / m;
        A(6, 3 * i + 3) = (K - i - 1 / 2) * f(3 * i + 3) * delta_t^2 / m; 
    end
end