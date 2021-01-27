function [in,out] = init(Im,TamRed,sel)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Genera los datos para el DataSet.
    F1 = imresize(Im,TamRed);
    in = F1(:);
    out = sel;
end
