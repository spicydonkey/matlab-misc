function mu = meanall(x,varargin)
% MEANALL finds mean of all elements in an N-dim array
% DKS
% 20181022

x_1d=x(:);      % shape N-dim array into 1D vector

mu=mean(x_1d,varargin{:});
end