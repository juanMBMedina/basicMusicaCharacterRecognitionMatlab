function dx = deriv(x)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Deriva una secuencia de datos.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    h = [1 -1];
    dx = conv(x,h);
    dx = dx(1:length(x));
    dx(1) = 0;  
end