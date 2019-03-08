function solang = cone_solang(half_angle)
%cone_solang - solid angle formula for cone

solang=2*pi*(1-cos(half_angle));
end