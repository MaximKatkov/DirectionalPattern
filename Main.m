function [] = Main( input, output)
%**************************************************************************
% SUMMARY:
%     This is the main (entrance point) function of the  simulator
% INPUTS:
%     input  - path to folder with input file (config.mat)
%     output - path to folder where output will be stored
% AUTHORS:
%     M.Katkov,
% HISTORY:
%     22/10/2024 - Created
%**************************************************************************

%% Fixing start time
tic
start_time = datestr(now, 'yyyy-mm-dd HH:MM:SS');
disp(['Simulation started on ', start_time]);

%%  Read initial configuration parameters 

cfgXmlFilePath = fullfile(input, '/config.mat');
if ~exist(cfgXmlFilePath, 'file')
    error('Input XML configuration file is inaccesible');
end
load(cfgXmlFilePath, 'config');

%% Start message
disp('New simulation trial has started.')
fprintf(' Input XML configuration file = %s\n', cfgXmlFilePath);
tStart = tic;

%% Start simulations

DirectionalPattern_Run(config, output)


%% End message
end_time = datestr(now, 'yyyy-mm-dd HH:MM:SS');
disp(['Simulation ended on ', end_time]);
tEnd = toc(tStart);
fprintf('Run time: %d min and %f secs\n',floor(tEnd/60),rem(tEnd,60));

end
    
