function [Pv,Ph] = ProyHY(x, view) 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calcula el valor de las proyecciones 
    %horizontal como vertical de la imagen
    %(Partitura)
    %---Pv--- (Vector de la proyeccion vertical)
    %---Ph--- (Vector de la proyeccion horizontal)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %x = double(x);
    [v, h] = size(x);
    Ph = sum(x,1)/h;
    Pv = sum(x,2)/v;    
    if view == 1    
        figure(1)
        subplot(2,2,1)
        plot(Ph)
        title('Poyeccion horizontal.')
        grid on
        subplot(2,2,3)
        imshow(x)
        axis off
        subplot(2,2,4);
        plot(Pv, 1:length(Pv))  
        title('Proyeccion vertical.')
        grid on
end
