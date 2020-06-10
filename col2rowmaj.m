function idx_rm = col2rowmaj(siz,in_CM)
% COL2ROWMAJ converts a COLUMN major array index (as in MATLAB 2D arrays) to ROW major array
% index as in MATLAB's subplot indicing.
%
%   in_CM: either INDICES (Nx1) or SUBSCRIPTS (Nx2)
% 
% DKS 2020

if size(in_CM,2) == 1
    S = ind2subv(siz,in_CM);
elseif size(in_CM,2) == 2
    S = in_CM;
else
    error('in_CM must be Nx1 or Nx2 array.');
end

idx_rm = sub2ind(fliplr(siz),S(2),S(1));

end