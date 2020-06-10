function col_hsl = rgb2hsl(col_rgb)
% RGB2HSL color space conversion.
%   col_hsl = rgb2hsl(col_rgb)
%
% based on "colorspace.m" by Pascal Getreuer
% DKS 2020

col_hsl=colorspace('RGB->HSL',col_rgb);
end