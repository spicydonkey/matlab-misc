function savesvg(hfig,filename)
% Save figures as SVG using MATLAB's default function.
% DKS 2020

timestr = getdatetimestr;
if nargin < 1
    hfig = gcf;
end
if ~exist('filename','var')
    filename = hfig.Name;
end
if isempty(filename)
    filename = 'untitled';
end
foutname = strjoin({filename,timestr,'.svg'},'_');
saveas(hfig,foutname,'svg');
end