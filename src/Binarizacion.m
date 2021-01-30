function Ib = Binarizacion(Img,umbral)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Binariza la imagen
    % Im = Imagen a binarizar.
    % umbral = Umbral de binarizacion.
    disp('Comienzo')
    [h,w] = size(Img);
    Ib = zeros(h,w);
    for i = 1 : h
        for j = 1 : w
            if double(Img(i,j)) > umbral
                Ib(i,j) = 0;
            else 
                Ib(i,j) = 255;
            end
        end 
    end
    Ib = uint8(Ib);
    disp('Fin')
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end