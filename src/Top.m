function [sound] = Top(fs,pulseMin,Nom)
    %Frec = [880 783.991 698.456 659.255 587.33 523.251...
    %    493.883 440 391.995 349.228 329.6280 293.6650 261.6260];
    Frec = [880 783.991 698.456 659.255 587.33 523.251...
        466.164 440 391.995 349.228 329.6280 293.6650 261.6260];
    Im = imread(Nom);
    ImGray = rgb2gray(Im);
    %Binariza la imagen.
    Imb = ~imbinarize(ImGray,graythresh(ImGray));
    disp('Binarizacion lista.')
    %Saca las proyecciones verticales y horizontales.
    [Pv,Ph] = ProyHY(Imb, 1);
    disp('Proyecciones listas.')
    %Recorta la imagen por renglones, reconoce y genera los vectores de nota 
    %y duracion.
    [note,duration] = Process(Pv,Ph,Imb,Frec);
    disp('Proceso listo.')
    [sound] = get_sound(fs,pulseMin,note,duration);
    disp('Escuche el sonido.')
end