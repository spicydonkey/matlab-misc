function c = packrows(x)
%PACKROWS packs each row of array into a cell and outputs a 1D column
%cell array.
%
%   C = packrows(X)
%
% DKS 2020

if ndims(x) > 2
    error('Array must not be more than 2D in size.');
end

c = arrayfun(@(I) x(I,:),(1:size(x,1))','uni',0);
end