function s = sumall(x,varargin)
% SUMALL sums all elements in an N-dim array
% DKS
% 20181019

s=sum(x(:),varargin{:});
end