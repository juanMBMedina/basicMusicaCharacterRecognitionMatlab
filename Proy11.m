clc,clear,close

Im = imread('Bajo1.jpg');
tic()
fs = 44100;
p = 360;
%Frec = [880 783.991 698.456 659.255 587.33 523.251...
%    493.883 440 391.995 349.228 329.6280 293.6650 261.6260];
  Frec = [880 783.991 698.456 659.255 587.33 523.251...
    466.164 440 391.995 349.228 329.6280 293.6650 261.6260];
%Binariza la imagen.
Img = rgb2gray(Im);
Imb = Binarizacion(Img,200);
%Saca las proyecciones verticales y horizontales.
[Pv,Ph] = ProyHY(Imb);
%Recorta la imagen por renglones, reconoce y genera los vectores de nota 
%y duración.
[note,duration] = Process(Pv,Ph,Imb,Frec);
[sound] = get_sound(fs,p,note,duration);
toc()