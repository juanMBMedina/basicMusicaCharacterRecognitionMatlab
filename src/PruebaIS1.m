clc,clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fs : Frecuencia de muestreo.
% p : Pulsos por minuto.
% Frec : Vector de frecuencias de la partitura.
% Im : Imagen.
fs = 8000;
p = 180;
Frec = [880 783.991 698.456 659.255 587.33 523.251...
    493.883 440 391.995 349.228 329.6280 293.6650 261.6260];
% Lee la imagen de la partitura.
nombre = 'Reloj';
Im = imread([nombre '.JPG']);
[Fig,Imf,lin] = ProsIm(Im);
[note,duration] = Reconocimiento(Fig,Imf,lin,Frec);
[sound] = get_sound(fs,p,note,duration);
p = audioplayer(sound,fs);
play(p)








