function varargout = columns(A)
% COLUMNS gets columns of array A.
%   [c1,c2,...] = columns(A)
%
% DKS 2020

n_col = size(A,2);
varargout = cell(1,n_col);
for ii = 1:n_col
    varargout{ii} = A(:,ii);
end

end