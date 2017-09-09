% startup_demo.m
% Matlab configuration file
% DKS
%
% Instructions: copy this file into the Matlab home directory (userpath)
% and rename as startup.m
%
% commands in this file will be executed when Matlab starts
%

% ADD PATH TO SCRIPT LIB
pathhome=userpath;      % home - MATLAB directory
if verLessThan('matlab','R2017a')
    pathhome=pathhome(1:end-1);     % cull the trailing semicolon
end
cd(pathhome);
addpath(genpath(pathhome));

% SET DEFAULT MATLAB figure text interpreter to latex
set(0,'defaulttextInterpreter','latex') %latex axis labels
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');

% FIGURE BACKGROUND
set(0,'defaultfigurecolor',[1,1,1]);