function [Imf] = Figuras(Fig,Imf)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entrega informacion a la red neuronal.
% Para encontrar la duracion de la nota y la frecuencia.

TI = size(Imf);
[Lf, ~] = bwlabel(Fig);
propf = regionprops(Lf);
% imshow(Fig)
for n = 1:length(propf)
%     
%     rectangle('Position',propf(n).BoundingBox,...
%     'EdgeColor','g','LineWidth',1)
%     hold on
    Cf = round(propf(n).BoundingBox);
    Base = Cf(1):Cf(1)+Cf(3);
    %Altura = Cf(2):Cf(2)+Cf(4);    
    if max(Base) > TI(2)
        Base = Cf(1):TI(2);
    end
    
    F1 = Imf(:,Base);  
    F1 = imopen(F1,[1 1 1]');
    F1 = imopen(F1,[1 1 1]);
    
    [~, N] = bwlabel(F1);
    if N == 0
        Imf(:,Base) = F1;
    end
end