function varargout = equaliseArraySize(varargin)
% equaliseArraySize
%   [X,Y,Z,...] = equaliseArraySize(x,y,z,...)
%
%   Outputs arrays of equal size. Scalar variables are repeated into an
%   array.
%
% DKS 2020

b_scalar = cellfun(@(x) isscalar(x),varargin);
if nargin == sumall(b_scalar)
    varargout = varargin;
    return;
end

% non-scalars must have equal size.
% var_array = varargin(~b_scalar);
var_size = cellfun(@(x) size(x),varargin(~b_scalar),'uni',0);
if sumall(~b_scalar)>1 & ~isequal(var_size{:})
    error('Array inputs are unequal in size.');
end
var_size = var_size{1};   % the array size

varargout = varargin;
for ii = 1:nargin
    if b_scalar(ii)
        varargout{ii} = ones(var_size)*varargin{ii};
    end
end

end