function phi_pol = elev2polar(phi_elev)
%elev2polar - converts elevation angle [-pi/2,pi/2] to polar angle [0,pi]

phi_pol = pi/2 - phi_elev;
end