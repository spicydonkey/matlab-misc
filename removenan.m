function x_filt = removenan(x)
%removenan - removes all NaN values in an array and returns a 1D vector
%
% Syntax:  x_filt = removenan(x)
%
% Inputs:
%   x       -  array
%
% Outputs:
%   x_filt  -  1D vector without NaNs
%
% Example:
%
%
% Other m-files required:
% Subfunctions: none
% MAT-files required: none
%
% See also:
% Author: David Shin
% Work address
% email: david.shin@anu.edu.au
% Website: https://github.com/spicydonkey
% March 2019; Last revision:
%------------- BEGIN CODE --------------
b_nan = isnan(x);
x_filt = x(~b_nan);
%------------- END OF CODE --------------
end