function S = solang_sphcap(theta)
%solang_sphcap
% solid angle of spherical cap
%   theta:  polar angle of cap
% DKS 2020
S = 2*pi*(1-cos(theta));
end