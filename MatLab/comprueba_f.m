function [falla, normas] = comprueba_f(f, Fmax, K)
    normas = zeros(K, 1);
    falla = 0;
    for i = 0: K-1
        normas(i + 1) = sqrt(f(3 * i + 1)^2 + f(3 * i + 2)^2 + f(3 * i + 3)^2);
        if f(3 * i + 1)^2 + f(3 * i + 2)^2 + f(3 * i + 3)^2 > Fmax^2
            falla = 1;
        end
    end
end