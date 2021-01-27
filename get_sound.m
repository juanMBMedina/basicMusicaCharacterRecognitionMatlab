function [y] = get_sound(fs,p,note,duration)
y = [];
%/==================Arreglo de Audio=========================\%
% Genera la senal de audio, de la cancion.
%    fs    : Frecuencia de muestreo.
%    p     : pulsos por minuto.
%   note   : Vector, Frecuencias de notas musicales.
% duration : Vector, Duracion de las notas.
%\===========================================================/%

    for i = 1 : length(note)
%/============Calcula el numero de muestras por nota=========\%    
        Xm = duration(i)*60*fs/p;
%\===========================================================/%
%/=================Genera la secuencia de datos==============\%    
        x = get_note(Xm,fs,note(i));
        y = horzcat(y,x);
%\===========================================================/%
    end    
end
