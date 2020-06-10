function x = unpackrows(c)
%UNPACKROWS unpacks the elements of a column cell array into row vector.
%
%   X = unpackrows(C)
%
% DKS 2020

% Check input.
if ~iscell(c) || ~isvector(c) || size(c,2)~=1
    error('Input must be a column cell array.');
end
nelem = unique(cellfun(@(x) numel(x),c));      % internal size of each cell element
if ~isscalar(nelem)
    error('Cell elements must have the same size.');
end

% Unpack.
try
    x = vertcat(c{:});
catch
    error('Ensure cell elements have same type and size.');
end
end