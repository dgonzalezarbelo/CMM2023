function [falla, cualesx, cualesy, cualesz] = comprueba_cono(x,y,z, K, alpha)
    falla = 0;
    cualesx = zeros(0,0);
    cualesy = zeros(0,0);
    cualesz = zeros(0,0);
    for i = 1:1:K
        if x(i)^2 + y(i)^2 > (z(i)^2)/alpha^2
            falla = falla + 1;
            cualesx = vertcat(cualesx, x(i));
            cualesy = vertcat(cualesy, y(i));
            cualesz = vertcat(cualesz, z(i));
        end
    end
end