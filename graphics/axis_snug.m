function ax = axis_snug(ax,gap)
% set axis limits with a gap proprtional to data range
%
%   ax: axes object
%   gap: fractional gap with respect to the data-range 
%       with 1x2 vector can specify gaps independently along X,Y
%
% DKS
% 2019-02-10

% check gap
if ~exist('gap','var')
    gap=0.1*[1,1];
end
if numel(gap)==1
    gap=gap*ones(1,2);
end
gapX=gap(1);
gapY=gap(2);


% get data limits
axis tight;
xlimData=get(ax,'XLim');
ylimData=get(ax,'YLim');


% define new axis limits
set(ax,'XLim',xlimData+gapX*diff(xlimData)*[-1,1]);
set(ax,'YLim',ylimData+gapY*diff(ylimData)*[-1,1]);

end