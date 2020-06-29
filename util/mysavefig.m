function mysavefig(hfig,filename)
% My wrapper to save figures as .fig file using MATLAB's default function.
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
foutname = strjoin({filename,timestr},'_');
saveas(hfig,[foutname,'.fig'],'fig');
end