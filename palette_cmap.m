function colors = palette_cmap(n,cmap)
% A vector of colors from a colormap and ditches the max value (usually the
% brightest)
%
%   colors = palette_cmap(n,cmap)
%
% DKS
% 2019-07-11 

    colors_full_range = cmap(n+1);
    
    % max color value is most "white" and invisible against white bgd
    colors = colors_full_range(1:end-1,:);      % get rid of brightest 
end