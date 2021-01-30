clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creacion del DataSet.
inputs = [];
target= [];
TamRed = [30 15];
for sel = 0 : 7
    Nombre = ['Fig' num2str(sel) '.jpg'];
    Num = 20;
    Im = imread(Nombre);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Binariza la imagen.
    Imb = Binarizacion(Im,200);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [Fig] = imerode(Imb,[1 1 1]');
    Fig = imdilate(Fig,strel('diamond',3));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Encuentra los objetos los reconoce.
    for i = 1 : Num
        [x,y] = init(Fig,Imb,TamRed,sel);
        inputs = horzcat(inputs,x);
        target = horzcat(target,y);
    end
    
end 
for i = 1 : 8
    loc = target == i-1;
    targets(i,:) = loc(:);
end    
save('DataSet.m','inputs','targets')