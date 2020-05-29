function theta = atan_pi(x)
%ATAN   Inverse tangent, result in radians in range [0,pi).
%   ATAN_PI(X) is the arctangent of the elements of X.
%
%   See also ATAN, ATAN2, TAN, ATAND, ATAN2D.

%   D K Shin 2020

theta = atan(x);
b_neg = theta < 0;
theta = theta + b_neg*pi;

end