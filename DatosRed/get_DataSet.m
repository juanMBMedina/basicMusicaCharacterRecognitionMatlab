clc,clear,close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creacion del DataSet.
input = [];
targets= [];
TamRed = [30 15];
for i = 1 : 3    
    for n = 1 : 700
    Nombre = ['ImRed' num2str(n) '.jpg'];
    Im = imread(Nombre);
    sel = floor((n-1)/100);
    [x,y] = init(Im,TamRed,sel);
    input = horzcat(input,x);
    targets = horzcat(targets,y);
    end
    
end
for i = 0 : 6
    loc = targets == i;
    target(i+1,:) = loc;    
end  
%save('DataSet.mat','input','target')