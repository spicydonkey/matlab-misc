function colorbar_minimal(cbar)
%colorbar_minimal - minimalist colorbar (east)
%   
% DKS
% 2019-03

c_lim = get(cbar,'Limits');     % colorbar axis limits
set(cbar,'Ticks',c_lim);        % Ticks at limits only

% label in centre
set(cbar.Label,'Position',[1.2,mean(c_lim),0]);
set(cbar.Label,'Rotation',-90);
set(cbar.Label,'VerticalAlignment','bottom');
end