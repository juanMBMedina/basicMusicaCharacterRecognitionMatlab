function [x,f] = get_fft(y,fs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% L : tamano de la señal de audio.
% nfft : Puntos de la fft.
% f : Vector, de frecuencias.
% x : Vector, de fft
    L = length(y);
    nfft = 2^nextpow2(L);
    x = fft(y,nfft)/L;
    f = fs/2*linspace(0,1,nfft/2+1);
    x = 2*abs(x(1:nfft/2+1));
    % Grafica la fft de la partitura.
    figure()
    t = (length(y)-1)*linspace(0,1,length(y))/(60*fs);
    subplot(2,1,1)
    plot(t,y)
    title('Dominio del tiempo')
    xlabel('Tiempo [s]')
    xlim([0 t(length(t))])
    subplot(2,1,2)
    plot(f,x/max(x))
    title('Dominio de la frecuencia')
    xlabel('Frecuencia [Hz]')
    xlim([0 max(f)])
end