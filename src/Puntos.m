function [dPvl,dPhl] = Puntos(Pv,Ph)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Devuelve las derivadas de las proyecciones.
    %dPvl Es el vector de coordenadas de las lineas del
    %pentagrama.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calcula la derivada de las proyecciones.
    dPv = deriv(Pv);
    dPh = deriv(Ph);
    %Para octave.
    % dPv = ValPos(dPv);
    % dPh = ValPos(dPh);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Encuenta los picos en las derivadas necesarios, lineas del pentagrama y
    %Comienzo y  final del pentagrama.
    [dPvp,dPvl] = findpeaks(abs(dPv),'MinPeakHeight',0.2*max(dPv));
    [dPhp,dPhl] = findpeaks(abs(dPh));
end