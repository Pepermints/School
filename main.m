% Date: 20.02.16 
% By: Tunvez Boulic
% Title: Granule Cell to Purkinje Cell model - learning by gradient descent


clear all

% Parameters
N_patterns = 50;        %number of patterns to learn
firingThreshold = 0;    %if the sum of the weights*x is above this threshold, y = 1

%Inputs: e: excitatory / i: inhibitory
N_input_e = 100;                    %number of excitatory input(a.k.a Granule cells)
alpha_e = 0.01;                     %learning speed of excitory cell (gradient descent 'speed')                   
init_w_e = rand(N_input_e, 1);      %initial weight initialized randomly between 0 & 1
                                       
N_input_i = 100;                    %number of inhibitory input
alpha_i = 0.01;                     %learning speed of inhibitory cell (gradient descent 'speed')                  
init_w_i = -rand(N_input_i, 1);     %initial weight initialized randomly between -1 & 0


% Simulation
N_cycles = 1500;                    %number of cycles

% Patterns generation
G = rand(N_input_e, N_patterns) >= 0.5;     % Granule Cells (excitory input) 
I = rand(N_input_e, N_patterns) >= 0.5;     % Inhibitory Cells
P = rand(1, N_patterns) >= 0.5;             % single Purkinje cell 'measured' output 

                                            
                                            
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

