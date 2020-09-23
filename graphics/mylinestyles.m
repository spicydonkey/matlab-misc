function l = mylinestyles(idx)
% mylinestyles returns an ordered list of line styles, or a single element
% indexed from the list (modulo the list length).
%
%   l = mylinestyles()
%   l = mylinestyles(idx)
%
% DKS 2020

l = {'-','--',':','-.'};

if nargin < 1
    return;
else
    l = l{mod(idx-1,length(l))+1};
end

end
    