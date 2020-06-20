function xd = getdiag(X)
%GETDIAG Diagonal elements of an array.
%   xd = getdiag(X)
% DKS 2020
xd = X(logical(eye(size(X))));
end