function X = maxnorm(A,d)
% Scale array to make max unity.
% DKS 2020
if nargin < 2
    d = 0;
end

if d == 0
    Amax = max(A(:));
else
    Amax = max(A,[],d);
end
X = A./Amax;
end