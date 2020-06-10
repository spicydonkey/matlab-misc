function S = solang_sphpol_elem(az1,az2,el1,el2)
%solang_sphpol_elem
% solid angle of an element of spherical polar (lat-long) grid
%   az1,az2:    azim boundaries of section (direction in conventional CC-z 1-->2)
%   el1,el2:    elev boundaries (elevation angle)
% DKS 2020

theta1 = elev2polar(el1);
theta2 = elev2polar(el2);

S_zone = abs(solang_sphcap(theta2) - solang_sphcap(theta1));    % spherical zone
r_az = wrapTo2Pi(az2 - az1)/(2*pi);     % ratio azimuthal section
S = r_az.*S_zone;
end