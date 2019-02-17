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

axesPosition=get(axesHandle,'position');
axesXlim=get(axesHandle,'xlim');
axesYlim=get(axesHandle,'ylim');

dxdX=diff(axesXlim)/axesPosition(3);
dydY=diff(axesYlim)/axesPosition(4);

x_ax = (x_fig-axesPosition(1))*dxdX;
y_ax = (y_fig-axesPosition(2))*dydY;

end