function [p_line,p_patch] = plot3fill(x,y,z,patchcol)
% Plots a 3D curve and fills area from z=0
%   [p_line,p_patch] = plot3fill(x,y,z,patchcol)
% DKS 2020
    
if nargin < 4
    patchcol = 0.5*[1,1,1];     % gray
end
    
formRectangles = @(m) [m(1:end-1);m(1:end-1);m(2:end);m(2:end)];

X = formRectangles(x);
Y = formRectangles(y);
Z = formRectangles(z);
Z(2:3,:) = 0;

p_patch = fill3(X,Y,Z,patchcol);
set(p_patch,'EdgeColor','none');
hold on;
p_line = plot3(x,y,z,'k');

end