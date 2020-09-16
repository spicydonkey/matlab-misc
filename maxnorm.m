function X = maxnorm(A)
% Scale array to make max unity.
% DKS 2020
Amax = max(A(:));
X = A/Amax;
end