function [note,duration] = Recognition(Fig,Imf,lin,Frec)
%/========================================================\%
% Entrega informacion a la red neuronal para encontrar la duracion
% de la nota y la frecuencia.
%/=========Calcula el numero de elementos=================\%

note = [];
duration = [];

TI = size(Imf);
[Lf, ~] = bwlabel(Fig);
propf = regionprops(Lf);
imshow(Imf)
for n = 1:length(propf)
     rectangle('Position',propf(n).BoundingBox,...
        'EdgeColor','g','LineWidth',1)
    hold on
    Cf = round(propf(n).BoundingBox);
    Base = Cf(1):Cf(1)+Cf(3);
    Altura = Cf(2):Cf(2)+Cf(4);    
    if max(Base) > TI(2)
        Base = Cf(1):TI(2);
    end
    F = imopen(Imf(Altura,Base),[1 1 1]'); 
    F1 = imresize(F,[30 15]);
    Fg = F1(:);
%/===============Entrega informacion a la NN=================\%    
% NN1,NN2,NN3,NN4 Son las redes neuronales entrenadas para el problema.
    Obj = NN4(double(Fg));   
    loc = Obj == max(Obj);
    k = 0;
    for i = 1 : length(loc)
        if loc(i) == 1
            k = i;
        end
    end
    
%\==========================================================/%    
%/=====Procesa la imagen para estraer caracteristicas=======\%    
    F2 = Imf(:,Base);  
    F2 = imopen(F2,[1 1 1]');
    F2 = imopen(F2,[1 1 1]);
    for j = 1 : length(lin)
        F2(lin(j),:) = 0;
    end
    F2 = imdilate(F2,strel('diamond',3));
    
%\==========================================================/%    
%/=======Calcula los datos de las caracteristicas===========\%    
    
    [Lg, ~] = bwlabel(F2);
    prop = regionprops(Lg);
    y = prop(1).Centroid(2);
%     x = prop(1).Centroid(1);
    switch k
        case 1
            note(n) = Nota(y,lin,Frec);
            duration(n) = 4;
        case 2
            note(n) = 0;
            if abs(lin(2)-y) < abs(lin(3)-y)
                duration(n) = 4;
            else
                duration(n) = 2;
            end
        case 3
            note(n) = Nota(y,lin,Frec);
            duration(n) = 2;
        case 4
            note(n) = Nota(y,lin,Frec);
            duration(n) = 2;
        case 5
            note(n) = Nota(y,lin,Frec);
            duration(n) = 1;
        case 6
            note(n) = Nota(y,lin,Frec);
            duration(n) = 1;
        otherwise
            note(n) = 0;
            duration(n) = 1;
    end 
%     figure(1)
%     subplot(1,4,1)
%     imshow(Imf(:,Base))
%     title('Imagen real')
%     subplot(1,4,2)
%     imshow(F1)
%     title('Imagen NN')
%     subplot(1,4,3)
%     imshow(F2)
%     hold on
%     plot(x,y,'*r')
%     title('Imagen Centroide')
%     hold off   
%       pause;
% 
   valid(k,n);
%     disp(duration(n))
%     disp(note(n))
     pause;
%     clc
end 

end    

