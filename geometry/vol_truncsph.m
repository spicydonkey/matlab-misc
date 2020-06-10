function V = vol_truncsph(r,z_trunc)
%vol_truncsph
% volume of a truncated sphere
%
%   r:  radius of sphere
%   z_trunc:    truncated height from equator
%
%   V:  volume of truncated sphere
%
% DKS 2020

V_sph = vol_sph(r);

theta_cap = acos(z_trunc./r);
theta_cap(z_trunc>r) = 0;       % no truncation

V_cap = vol_sphcap(theta_cap,r);

V = V_sph - 2*V_cap;
end