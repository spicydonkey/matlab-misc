function col_rgb = hsl2rgb(col_hsl)
% HSL2RGB color space conversion.
%   col_rgb = hsl2rgb(col_hsl)
%
% based on "colorspace.m" by Pascal Getreuer
% DKS 2020

col_rgb=colorspace('HSL->RGB',col_hsl);
end