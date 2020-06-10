function S_azel = solang_azel_grid(az,el)
%solang_azel_grid
% solid angle of spherical polar (lat-long) edge grid
%
% DKS 2020

S_azel = solang_sphpol_elem(az(1:end-1,1:end-1),az(2:end,2:end),...
    el(1:end-1,1:end-1),el(2:end,2:end));
end