function h_hatch = hatch_axis(ax)
%hatch_axis - fills axes with hatchfill
%   h_hatch = hatch_axis(ax)
%
% DKS
% 2019-03

% axis rectangle vertices
ax_xlim=get(ax,'XLim');
ax_ylim=get(ax,'YLim');
[x,y]=rect_vertices(ax_xlim(1),ax_ylim(1),diff(ax_xlim),diff(ax_ylim));

% patch to current axis
p = patch('XData',x,'YData',y,'FaceColor','none','EdgeColor','none');

% hatchfill
h_hatch=hatchfill2(p,'single','HatchAngle',45,'HatchDensity',15,...
    'HatchColor','k','HatchLineWidth',get(ax,'LineWidth'));
uistack(h_hatch,'bottom');      % move hatch object to bottom layer
end