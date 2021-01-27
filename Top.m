function [sound,k] = Top(fs,p,Nom)

%Frec = [880 783.991 698.456 659.255 587.33 523.251...
%    493.883 440 391.995 349.228 329.6280 293.6650 261.6260];
  Frec = [880 783.991 698.456 659.255 587.33 523.251...
    466.164 440 391.995 349.228 329.6280 293.6650 261.6260];
Im = imread(Nom);
k = 0;
for i = 1 : length(Nom)
    if Nom(i) == '.'
        k = i-1;
    end
end
%Binariza la imagen.

Imb = double(~imbinarize(Im,graythresh(Im)));
disp('Binarizacion lista.')
%Saca las proyecciones verticales y horizontales.
[Pv,Ph] = ProyHY(Imb);
disp('Proyecciones listas.')
%Recorta la imagen por renglones, reconoce y genera los vectores de nota 
%y duracion.
[note,duration] = Process(Pv,Ph,Imb,Frec);
disp('Proceso listo.')
[sound] = get_sound(fs,p,note,duration);
disp('Escuche el sonido.')
end