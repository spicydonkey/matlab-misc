function sig = stdall(x,varargin)
% STDALL finds the standard deviation of all elements in an N-dim array
% DKS
% 20181031

x_1d=x(:);
sig=std(x_1d,varargin{:});
end