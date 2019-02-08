function config_fig = loadFigureConfig()
% Loads standard graphics figure related properties
%
% DKS
% 2018-02-08
%

% defaults
config_fig.units='centimeters';
config_fig.pos_full=[0,0,17.2,6];       % full page width
config_fig.pos_2col=[0,0,8.6,3.2];      % 2-column
config_fig.rend='painters';
config_fig.ax_fontsize=9;
config_fig.ax_lwid=0.5;
config_fig.mark_siz=4;
config_fig.line_wid=0.5;

config_fig.line_sty={'-','--',':','-.'};
% config_fig.mark_typ={'+','o','*','.','x','s','d','^','v','>','<','p','h'};
config_fig.mark_typ={'o','s','^','d'};


end