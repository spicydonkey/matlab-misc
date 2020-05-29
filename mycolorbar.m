function cb = mycolorbar
% MYCOLORBAR
%  creates a colorbar with customised properties
% DKS 2020

cb = colorbar();


% latex everywhere
cb.Label.Interpreter = 'latex';
cb.TickLabelInterpreter = 'latex';

end