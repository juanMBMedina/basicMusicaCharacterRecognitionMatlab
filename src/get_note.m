function [y] = get_note(N,fs,fc)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %  N :  Numero de muestras del sonido.
    % fc : Frecuencia de la nota.
    % fs : Frecuencia de muestreo.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    n = 0:N-1;
    y = zeros(1,length(n));
    for i = 1 : length(n)
        y(i) = 0.01*exp(-n(i)/10000)*sin(2*pi*fc*n(i)/fs);
    end
end
