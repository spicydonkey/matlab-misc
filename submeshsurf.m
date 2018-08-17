function submeshsurf(Ssurf,fracMesh,line_col,line_wid,is_nd_type)
% Reduces visual density of mesh grid on surface plot
%
%   Ssurf:      surface data structure
%   fracMesh:   2-vector of fraction of grid to display
%   colEdge:    color of mesh edges
%
% Code based on: https://uk.mathworks.com/matlabcentral/answers/91517-how-can-i-reduce-the-number-of-mesh-lines-shown-in-a-surface-plot-in-matlab
%
% DKS
% 2018-08-17

%% get optional params
if length(fracMesh)==1
    fracMesh=fracMesh*[1,1];
end
if ~exist('line_col','var')
    line_col='k';
end
if ~exist('line_wid','var')
    line_wid=0.5;
end
if ~exist('is_nd_type','var')
    is_nd_type=false;
end
%% Extract X,Y and Z data from surface plot
x=Ssurf.XData;
y=Ssurf.YData;
z=Ssurf.ZData;
% check grid type
if is_nd_type
    x=x';
    y=y';
    z=z';
end
%% Create vectors out of surface's XData and YData
x=x(1,:);
y=y(:,1);
%% Divide the lengths by the number of lines needed
xspacing = round(1/fracMesh(1));
yspacing = round(1/fracMesh(2));
%% Plot the mesh lines 
% Plotting lines in the X-Z plane
hold on
for ii = 1:yspacing:length(y)
    Y1 = y(ii)*ones(size(x)); % a constant vector
    Z1 = z(ii,:);
    plot3(x,Y1,Z1,'-',...
        'Color',line_col,'LineWidth',line_wid);
end
% Plotting lines in the Y-Z plane
for ii = 1:xspacing:length(x)
    X2 = x(ii)*ones(size(y)); % a constant vector
    Z2 = z(:,ii);
    plot3(X2,y,Z2,'-',...
        'Color',line_col,'LineWidth',line_wid);
end
hold off


end