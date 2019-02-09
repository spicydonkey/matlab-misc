function ax = xtight(ax)
% set x-axis limits to min-max of data leaving y-lim unchanged
% DKS
% 2019-02-10

% check if axes object given
if ~exist('ax','var')
    ax=gca;
end

ylimOriginal=ax.YLim;
axis tight;
set(ax,'YLim',ylimOriginal);

end