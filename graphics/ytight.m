function ax = ytight(ax)
% set y-axis limits to min-max of data leaving x-lim unchanged
% DKS
% 2019-02-10

% check if axes object given
if ~exist('ax','var')
    ax=gca;
end

xlimOriginal=ax.XLim;
axis tight;
set(ax,'XLim',xlimOriginal);

end