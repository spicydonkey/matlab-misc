function [min_max,I] = myminmax(x,Dim)
% Range of matrix
%
%   x: 2-dim matrix
%
%   Dim: 0/1/2 specifying the matrix dimension along which to find min,
%   max. if Dim unspecified (or 0), the matrix-wise extrema are returned
%
% DKS
% 2018-02-10

% check if Dim specified
if ~exist('Dim','var')
    Dim=0;
end

if Dim == 0
    [xmin,Imin]=min(x(:));
    [xmax,Imax]=max(x(:));

    min_max = [xmin;xmax];
    
    % indices
    Isub=cell(1,2);
    [Isub{:}]=ind2sub(size(x),[Imin;Imax]);
    I=cat(2,Isub{:});
else
    [xmin,Imin]=min(x,[],Dim);
    [xmax,Imax]=max(x,[],Dim);
    
    min_max=cat(Dim,xmin,xmax);
    I=cat(Dim,Imin,Imax);
end

end