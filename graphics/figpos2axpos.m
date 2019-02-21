function [x_ax, y_ax] = figpos2axpos(axesHandle,x_fig,y_fig)
% Convert location in figure with respect to axis data coordinates
%
% INPUT:
%   axesHandle: handle to axes
%   x_fig, y_fig: x,y coordinate to a point in axes' units
%   
% OUTPUT:
%   x_ax, y_ax: location in axis data unit
%
%
% Example:
%   >> % create a patch to fill the whole figure
%   >> % TODO...
%
% DKS
% 2019-02-17

% axesPosition=get(axesHandle,'position');
axesplotboxPosition=plotboxpos(axesHandle);     % get plot-box position

axesXlim=get(axesHandle,'xlim');
axesYlim=get(axesHandle,'ylim');

dxdX=diff(axesXlim)/axesplotboxPosition(3);
dydY=diff(axesYlim)/axesplotboxPosition(4);

x_ax = (x_fig-axesplotboxPosition(1))*dxdX + axesXlim(1);
y_ax = (y_fig-axesplotboxPosition(2))*dydY + axesYlim(1);

end