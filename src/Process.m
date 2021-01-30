function [note,duration] = Process(Pv,Ph,Imb,Frec)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calcula la derivada de las proyecciones.
    dPv = deriv(Pv);
    dPh = deriv(Ph);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Encuenta los picos en las derivadas necesarios, lineas del pentagrama y
    %Comienzo y  final del pentagrama.
    [dPvp,dPvl] = findpeaks(dPv,'MinPeakHeight',0.2*max(dPv));
    [dPhp,dPhl] = findpeaks(abs(dPh));
    %[dPvl,dPhl] = Puntos(Pv,Ph);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Encuentra los intervalos posibles donde estan los renglones del penta-
    %grama.
    k = 0;
    penta = length(dPvl)/5;
    Cv = zeros(1,2);
    for i = 1 : penta 
        k = k + 1;
        t = i - 1;
        P = dPvl(1+5*t:5*i);
        D = max(P)- min(P);
        Cv(i,k) = min(P)- round(D);
        Cv(i,k+1) = max(P)+round(D);
        if Cv(i,k) <= 0
            Cv(i,k) = 1;
        end
        if Cv(i,k+1) > length(Pv)
            Cv(i,k+1) = length(Pv);
        end
        k = 0;
    end
    Ch = min(dPhl):max(dPhl);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Recorta la imagen binarizada, del corte vertical
    Ims = Imb(:,Ch);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Recorta la imagen binarizada, del corte horizontal 
    %para los renglones y crea el vector de nota y duracion.
    k = 0;
    note = [];
    duration = [];
    for i = 1 : penta
        k = k + 1;
        h = Cv(i,k):Cv(i,k+1);
        R = Ims(h,:); 
        %/==================Arreglo de imagen2=========================\%
        %Quita las lineas horizontales.    
        Fig  = imdilate(R,strel('square',2)); 
        Fig  = imerode(Fig,[1 1 1;1 1 0]'); 
        Fig  = imdilate(Fig,strel('square',2)); 
        Fig  = imdilate(Fig,ones(5,2));
        %Quita las lineas de cada compas.    
        Imf = Figuras(Fig,R);
        %Quita las lineas horizontales.    
        Fig  = imdilate(Imf,strel('square',2)); 
        Fig  = imerode(Fig,[1 1 1;1 1 0]'); 
        Fig  = imdilate(Fig,strel('square',2)); 
        Fig  = imdilate(Fig,ones(5,2));
        %\=============================================================/%    
        [Pv,Ph]  = ProyHY(Imf);
        [lin,~]  = Puntos(Pv,Ph);
        %[DataSet] = GetDataSet(Fig,Imf);
        [xn,yn]  = Recognition(Fig,Imf,lin,Frec);
        note    = horzcat(note,xn);
        duration = horzcat(duration,yn);
        %     figure(1)
        %     imshow(Imf)
        %     figure(2)
        %     imshow(Fig)
        %     pause(0.1);
        k = 0;    
    end   
    %Graficas de las proyecciones horizontales y verticales.
    % figure()
    % subplot(2,1,1)
    % plot(Pv)
    % xlim([0 length(Pv)])
    % title('Proyeccion vertical.')
    % subplot(2,1,2)
    % plot(dPv)
    % hold on
    % plot(dPvl,dPvp,'or')
    % xlim([0 length(dPv)])
    % title('Derivada proyeccion vertical.')
    % figure()
    % subplot(2,1,1)
    % plot(Ph)
    % xlim([0 length(Ph)])
    % title('Proyeccion horizontal.')
    % subplot(2,1,2)
    % plot(abs(dPh))
    % hold on
    % plot(dPhl,dPhp,'or')
    % xlim([0 length(dPh)])
    % title('Derivada proyeccion horizontal valor absoluto.')
end
