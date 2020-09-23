function m = mymarkersymbols(idx)
% mymarkersymbols returns an ordered list of marker symbols, 
% or a single element indexed from the list (modulo the list length).
%
%   m = mymarkersymbols()
%   m = mymarkersymbols(idx)
%
% DKS 2020

m = {'o','+','*','.','x','s','d','^','v','>','<','p','h'};

if nargin < 1
    return;
else
    m = m{mod(idx-1,length(m))+1};
end
    
end