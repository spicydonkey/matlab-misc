function [x,y] = rect_vertices(x0,y0,w,h)
%rect_coords - X,Y vertex coordinates of rectangle
x = [x0     x0+w    x0+w    x0];
y = [y0     y0      y0+h    y0+h];
end