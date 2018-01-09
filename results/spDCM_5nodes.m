% by Simon Schwab, 2017
% Adapted from an worked example by Adeel Razi & Guillaume Flandin

%% Initialise SPM
spm('Defaults','fMRI');
spm_jobman('initcfg');

%% Variables and data
N  = 50;
TR = 3;
Nt = 200;
Nn = 5;

resdir = '/home/simon/Data/DGM/results';

load('/home/simon/Data/DGM/data/sim/timeseries/sim22.mat')

DCM_Ep_A = nan(Nn,Nn,N);

for s=1:50
    % Extract time series of subject s from 2D N*time x nodes array
    myts = ts(((s-1)*Nt+1):(Nt*s),:);
    %sprintf('%d to %d', ((s-1)*Nt+1), (Nt*s))
        
    %% Specify and estimate DCM
    clear DCM;
    
    % Metadata
    v = Nt; % number of time points
    n = Nn; % number of regions
    
    DCM.v = v;
    DCM.n = n;
    
    % Timeseries
    DCM.Y.dt  = TR;
    %DCM.Y.X0  = DCM.xY(1).X0;
    DCM.Y.Q   = spm_Ce(ones(1,n)*v);
    for i = 1:DCM.n
        DCM.Y.y(:,i)  = myts(:,i);
        DCM.Y.name{i} = num2str(i);
    end
    
    % Task inputs
    DCM.U.u    = zeros(v,1);
    DCM.U.name = {'null'};
    
    % Connectivity
    DCM.a  = ones(n,n);
    DCM.b  = zeros(n,n,0);
    DCM.c  = zeros(n,0);
    DCM.d  = zeros(n,n,0);
    
    % Timing
    DCM.TE     = 0.04;
    DCM.delays = repmat(TR,DCM.n,1);
    
    % Options
    DCM.options.nonlinear  = 0;
    DCM.options.two_state  = 0;
    DCM.options.stochastic = 0;
    DCM.options.analysis   = 'CSD';
    DCM.options.induced   = 1;
    % DCM.options.nmax    = 8;
    
    
    str = sprintf('spDCM_tmp');
    DCM.name = str;
    save(fullfile(resdir,str),'DCM');
    
    DCM = spm_dcm_fmri_csd(fullfile(resdir,str));
    DCM_Ep_A(:,:,s) = DCM.Ep.A;
    
end

save(fullfile(resdir,'spDCM_Ep_A_sim22'), 'DCM_Ep_A')
