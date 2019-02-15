function print_vecrast(figureHandle,varargin)
% wrapper for vecrast to save figure with commonly used file-naming, etc.
% DKS

%%% David's defaults
if ~isempty(figureHandle.Name)
    fname=figureHandle.Name;
else
    fname='temp';
end
default_filename=strcat(fname,'_',getdatetimestr);
default_resolution=300;
default_stack='bottom';
default_exportType='pdf';

% input parser
p = inputParser;
addRequired(p,'figureHandle',@ishandle)
addParameter(p,'filename',default_filename,@ischar);
addParameter(p,'resolution',default_resolution,@isnumeric);
addParameter(p,'stack',default_stack,@ischar);
addParameter(p,'exportType',default_exportType,@ischar);
parse(p,figureHandle,varargin{:});

% call vecrast
vecrast(figureHandle,p.Results.filename,p.Results.resolution,p.Results.stack,p.Results.exportType);
end