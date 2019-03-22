function cm_rgb = monochrome_cmap(hue,invert)
%gen_monochrome_cmap - generate a simple monochromatic colormap
%
% Syntax:  cm_rgb = monochrome_cmap(hue,invert)
%
% Inputs:
%   * hue       -  main Hue angle (0 <= hue <= 180)
%   * invert    -  0 (default) or 1. toggles white-black direction.
%                   default is white=low and black=high.
%
% Outputs:
%   * cm_rgb    -  256-color palette in RGB.
%
% Example:
%   hue_blue = 240;
%   cm_blue = monochrome_cmap(hue_blue,0);
%   temp_data = load('clown.mat');
%   figure;
%   imagesc(temp_data.X);
%   colormap(gca,cm_blue);
%   colorbar(gca);
%   
%
% Other m-files required: colorspace.m
% Subfunctions: none
% MAT-files required: none
%
% See also: Colormaps, viridis, red, blue
% Author: David Shin
% Work address
% email: david.shin@anu.edu.au
% Website: https://github.com/spicydonkey
% March 2019; Last revision:
%------------- BEGIN CODE --------------

% create HSL 256-color palette
cm_hsl = NaN(256,3);
cm_hsl(:,1)=hue;
cm_hsl(:,2)=1;                  % completely saturate to set main at L=0.5
luminance=linspace(1,0,256);    % white --> black
if invert==1
    luminance=flip(luminance);
end
cm_hsl(:,3)=luminance;

% translate to RGB
cm_rgb = colorspace('hsl->rgb',cm_hsl);

% % print output to screen
str_cm_rgb = num2str(cm_rgb,6);     % 6 digit precision

fprintf('-------------------------------------------------\n');
for ii = 1:size(cm_rgb,1)
    fprintf('%s\n',str_cm_rgb(ii,:));
end
fprintf('-------------------------------------------------\n');

% % visualise colormap
% TODO


%------------- END OF CODE --------------
end