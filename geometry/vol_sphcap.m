function V = vol_sphcap(theta,r)
%vol_sphcap
% volume of spherical cap
%   theta:  polar angle of spherical cap
%   r:      radius of sphere
%
%   V:      volume of spherical cap
%
% DKS 2020
V = pi/3 * r.^3 .* (2 + cos(theta)) .* (1 - cos(theta)).^2;
end