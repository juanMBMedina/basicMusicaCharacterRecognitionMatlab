clc, clear variables, close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fs : Frecuencia de muestreo.
% p : Pulsos por minuto.
% note : Vector, Notas musicales.
% duration : Vector, Duracion de las notas musicales.
% y : Sonido.
% x : Vector, abs(fft(y)) grafica
% f : Vector, Frecuencias grafica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fs = 8000;
p = 140;
note = [0 0 659.5 659.5 659.5 659.5 659.5 659.5 659.5 554.365 0 659.5 659.5 659.5 659.5 739.989 659.5 830.609 830.609];
duration = [2 1 0.5 1 1 0.5 1 0.5 1 1.5 1 0.5 1 1 0.5 1 0.5 1 1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y = get_sound(fs,p,note,duration);
[x,f] = get_fft(y,fs);
p = audioplayer(y,fs);
play(p)