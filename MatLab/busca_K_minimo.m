function minK = busca_K_minimo(K, p_0, v_0, p_K, v_K, delta_t, m, g, Fmax, alpha, options)
    ini = 0;
    fin = K;
    while ini < fin
        if ini == fin - 1
            minK = fin;
            break;
        elseif ini == fin - 2
            [solucion_artificial, ~, ~, ~] = inicializacion(fin - 1, p_0, v_0, p_K, v_K, delta_t, m, g, Fmax, alpha, options);
            artificiales_grandes = 0;
            for i = 1:fin - 1 + 6
                if solucion_artificial(fin - 1 + i) > 10e-1
                    artificiales_grandes = artificiales_grandes + 1;
                end
            end
            if artificiales_grandes == 0
                minK = fin - 1;
            else
                minK = fin;
            end
            break;
        else
            medio = floor((ini + fin) / 2);
            [solucion_artificial, ~, ~, ~] = inicializacion(medio, p_0, v_0, p_K, v_K, delta_t, m, g, Fmax, alpha, options);
            artificiales_grandes = 0;
            for i = 1:medio + 6
                if solucion_artificial(3 * medio + i) > 10e-5
                    artificiales_grandes = artificiales_grandes + 1;
                end
            end
            if artificiales_grandes == 0
                fin = medio;
            else
                ini = medio;
            end
        end
    end
end