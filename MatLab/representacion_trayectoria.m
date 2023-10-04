function representacion_trayectoria(f, K, delta_t, g, m, consumo)
    f = [f; zeros(3,1)]; % La fuerza al final es 0, la incluimos para la rep    
    [~, p] = calcula_v_y_p(f, K, delta_t, g, m);
    [px, py, pz] = de_p_a_xyz(p, K);
    [fx, fy, fz] = de_p_a_xyz(f, K);

    % Crea una figura 3D
    figure('WindowState', 'fullscreen');
    hold on;
    axis equal; % Hace que los ejes tengan la misma escala
    grid on;
    
    % Dibuja puntos como esferas rojas
    scatter3(px, py, pz, 'r', 'filled');
    
    % Dibuja vectores como líneas azules
    quiver3(px, py, pz, fx, fy, fz, 'b');
    
    % Establece la vista inicial
    view(3); % Vista en 3D
    
    % Configura la animación de rotación
    azimuth_step = 1; % Paso de rotación en azimuth (grados)
    elevation_step = 0.5; % Paso de rotación en elevación (grados)
    num_frames = 360; % Número de cuadros en la animación
    
    xmin = -40;
    xmax = 65;
    ymin = 0;
    ymax = 55;
    zmin = 0;
    zmax = 115;

    xlim([xmin, xmax]);
    ylim([ymin, ymax]);
    zlim([zmin, zmax]);

    titulo = sprintf('Consumo mínimo: %.2f', consumo); % Cambia el formato según tus necesidades
    title(titulo);

    for i = 1:num_frames
        % Calcula el ángulo de azimut y elevación para la animación
        azimuth = i * azimuth_step;
        elevation = 30; % Puedes ajustar esto según tus necesidades
        
        % Actualiza la vista de la cámara
        view(azimuth, elevation);
        
        % Pausa para crear la animación
        pause(0.01);
    end

end