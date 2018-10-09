function hh = myploterr(x, y, xerr, yerr, mrk, c)
%MYPLOTERR My wrapper for error bar plot PLOTERR
%
% DKS
% 20181009

%%% input arg check
if ~exist('mrk','var')
    mrk='o';        % default CIRCLE
end
if ~exist('col','var')
    c=[0,0,1];	% default BLUE
end

%%% wrapper
hh = ploterr(x,y,xerr,yerr,mrk,'hhxy',0);

clight=colshades(c);

set(hh(1),'Marker',mrk,'Color',c,'MarkerFaceColor',clight);
for ii=2:numel(hh)
    set(hh(ii),'Color',c);
end

end