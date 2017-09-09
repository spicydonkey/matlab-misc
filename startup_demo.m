% commands in this file will be executed when Matlab starts

% ADD PATH TO SCRIPT LIB
% TODO - currently only works correctly for 2017~ versions
pathhome=userpath;      % home - MATLAB directory
cd(pathhome);
addpath(genpath(pathhome));


% SET DEFAULT MATLAB figure text interpreter to latex
set(0,'defaulttextInterpreter','latex') %latex axis labels
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');
