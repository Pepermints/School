% Date: 20.02.16 
% By: Tunvez Boulic
% Title: Granule Cell to Purkinje Cell model - learning by gradient descent


clear all

% Parameters
N_patterns = 50;        %number of patterns to learn
firingThreshold = 0;    %if the sum of the weights*x is above this threshold, y = 1
% N_output = 1;         %number of outputs (Purkinje cell)
rate_P = 60;            %Purkinje cell firing rate [Hz ie. spikes/s]

%Inputs: e: excitatory / i: inhibitory
N_input_e = 100;                    % number of excitatory input(a.k.a Granule cells)
alpha_e = 0.01;                     % learning speed (gradient descent 'speed')                   
init_w_e = rand(N_input_e, 1);      % initial weight initialized randomly between 0 & 1
rate_e = 3;                         % Granule cell firing rate [Hz]
                                       
N_input_i = 100;                    % number of inhibitory interneurons input
alpha_i = 0.01;                     % learning speed (gradient descent 'speed')                  
init_w_i = -rand(N_input_i, 1);     % initial weight initialized randomly between -1 & 0
rate_i = 30;                        % firing rate [Hz]

% Simulation
T = 50;                             % Length of simulation [s]
dt = 0.01;                          % Timestep [s]
N_cycles = T/dt;                    % number of cycles

% Patterns generation
G = rand(N_input_e, N_patterns) < rate_e * dt;     % Granule Cells (excitory input) 
I = rand(N_input_i, N_patterns) < rate_i * dt;     % Inhibitory Cells
P = rand(1, N_patterns) < rate_P *dt;             % single Purkinje cell 'measured' output 
                                            
                                            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RUN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[ weights_history_e, weights_history_i, error ] = run(N_cycles, firingThreshold, N_patterns, P, G, alpha_e, init_w_e, I, alpha_i, init_w_i);

% %run with alpha = 0.01:0.01:0.05
% for j = 1:5
%    run(0.01*j, init_w, N_cycles, N_patterns, P, G, firingThreshold); 
% end


%%%%%%%%%%%%%%%%%%%%%%%%%%%% RESULT CHECK %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
plot(0:N_cycles,  weights_history_e);
figure
plot(0:N_cycles,  weights_history_i);
error_percentage = size(find(error),2)/size(error,2)

