function [Pv,Ph] = ProyHY(x) 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calcula el valor de las proyecciones 
    %horizontal como vertical de la imagen
    %(Partitura)
    %---Pv--- (Vector de la proyeccion vertical)
    %---Ph--- (Vector de la proyeccion horizontal)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x = double(x);
    Tam = size(x);
    v = Tam(1,1);
    h = Tam(1,2);
    Ph = zeros(1,h);
    Pv = zeros(1,v);    
    for i = 1 : h
        Ph(i) = sum(x(:,i))/h;
    end
    for i = 1 : v
        Pv(i) = sum(x(i,:))/v;
    end
    %     Ph = Ph/max(Ph);
    %     Pv = Pv/max(Pv);    
    %     figure()
    %     subplot(2,2,4);
    %     plot(Pv,0:v-1,'b')  
    %     title('Proyeccion vertical.')
    %     ylim([0 v-1])
    %     grid on
    %     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %     subplot(2,2,3)
    %     imshow(x)
    %     axis on
    %     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %     subplot(2,2,1)
    %     plot(0:h-1,Ph)
    %     title('Poyeccion horizontal.')
    %     xlim([0 h-1])
    %     grid on      
end
