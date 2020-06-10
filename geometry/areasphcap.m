function A = areasphcap(theta,r)
%areasphcap
% area of spherical cap
%   theta:  polar angle of cap
%   r:      radius of sphere
% DKS 2020
if nargin<2
    r = 1;
end
A = 2*pi*(r.^2).*(1-cos(theta));
end