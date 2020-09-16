function j = sphbesselj(n,x)
% spherical Bessel function of the first kind
% http://people.math.sfu.ca/~cbm/aands/page_437.htm
% DKS 2020
    j = sqrt(pi./(2*x)).*besselj(n+1/2,x);
end