function S = load_collate(path_data,file_head,close_figs)
% load_collate
%
% S = load_collate(path_data,file_head,file_ext,close_figs)
%
%   S is a cell-array of data struct.
%   
% DKS 2020

if ~exist('close_figs')
    close_figs = false;
end

dirlist = dir(path_data);
ntotdir = numel(dirlist);
l_head = length(file_head);

S = cell(1,ntotdir);
nn = 0;
for ii = 1:ntotdir
    tfname = dirlist(ii).name;
    [~,~,f_ext] = fileparts(tfname);
    if length(tfname) < l_head
        continue
    end
    
    if strcmp(tfname(1:l_head),file_head) && strcmp(f_ext,'.mat')
        nn = nn+1;
        S{nn} = load(fullfile(path_data,dirlist(ii).name));
    end
    if close_figs
        close all;      % supress figures
    end
end
S = S(1:nn);

end