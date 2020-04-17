% Allan deviation script handling in/outputs of allan v2.24 (mod)
% DK Shin
% 23/08/16

function [adev,tau,errorb,stat] = allan_dev(t,sig)

% Create time-domain data
dt = diff(t);
dt_avg = mean(dt);
dt_std = std(dt);
Nsamp = length(t);

if dt_std > 1e-2*dt_avg
    fprintf('Warning: check sampling rate consistenty. dt_avg=%.2g, dt_std=%.2g \n',dt_avg,dt_std);
end

% Create input data
data.freq = sig;
data.rate = 1/dt_avg;

tau_in = dt_avg*round(logspace(0,log10(Nsamp),30));   % array of tau values to evaluate Allan deviation

%% Run Allan deviation script
%[adev, stat, errorb, tau] = allan(data,tau_in,'Allan deviation',2);
%xlim auto;
[adev, stat, errorb, tau] = allan(data,tau_in,'Allan deviation',0);


% % Plot results from Allan 1
% figure();
% errorbar(tau,adev,errorb,'rx');
% set(gca,'XScale','log');
% set(gca,'YScale','log');
% 
% xlabel('\tau (s)');
% ylabel('\sigma_{y}(\tau) ()');
% title('');