function [Note] = Nota(y,lin,Frec)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calcula la frecuencia de la nota.
    % y = Ordenada del centro de masa.
    % lin = Vector de las ordenadas del cada linea del
    %       pentagrama.
    % Frec = Vector de frecuencias desde C4 hasta A5.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calcula la diferencia de distancia entre las
    %lineas del pentagrama.
    dif = zeros(1,length(lin)-1);
    for i = 1 : length(dif)
        dif(i) = lin(i+1)-lin(i);
    end
    dif = sum(dif)/length(dif);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %D = Distancia entre lineas.
    D = round(dif);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Vector de posiciones posibles.
    Pos = zeros(1,13);
    Pos(1) = lin(1)-D;
    Pos(2) = lin(1)-D/2;
    k = 2;
    for i = 1 : length(lin)
        for j = 0 : 1  
            k = k + 1;
            Pos(k) = lin(i)+ j*D/2;
        end
    end
    Pos(13) = lin(5)+D;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Calcula el vector de error para encontrar 
    %la menor distancia.
    err = zeros(1,length(Pos));
    for i = 1 : length(err)
        err(i) = abs(y - Pos(i));
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Encuentra la posicion del error minimo.
    loc = err == min(err);
    for i = 1 : length(loc)
        if loc(i) == 1
            k = i;
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Note = Frec(k);
end