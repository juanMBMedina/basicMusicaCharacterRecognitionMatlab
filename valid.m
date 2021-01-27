function [] = valid(k,n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Muestra por pantalla que figura reconocio...
% la red neuronal.
    if k == 1
        disp(['Figura: ' num2str(n) ' es: Redonda' ])
    end
    if k == 2
        disp(['Figura: ' num2str(n) ' es: Silencio Redonda/Blanca' ])
    end
    if k == 3 || k == 4
        disp(['Figura: ' num2str(n) ' es: Blanca' ])
    end
    if k == 5 || k == 6
        disp(['Figura: ' num2str(n) ' es: Negra' ])
    end
    if k == 7
        disp(['Figura: ' num2str(n) ' es: Silencio Negra' ])
    end
end