function V = vol_truncsphshell(r_in,r_out,z_trunc)
%vol_truncsphshell
% volume of a truncated spherical shell
%
%   r_in (r_out):   inner (outer) shell radius
%   z_trunc:        truncated height from equator
%
%   V:              volume of a truncated spherical shell
%
% DKS 2020
V = vol_truncsph(r_out,z_trunc) - vol_truncsph(r_in,z_trunc);
end