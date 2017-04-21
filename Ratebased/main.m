clear all;

%Inputs: e: excitatory / i: inhibitory
N_input_e = 3000;                    % number of excitatory input(a.k.a Granule cells)
alpha_e = 0.001;                     % learning speed (gradient descent 'speed')                   
%init_w_e = rand(N_input_e, 1);      % initial weight initialized randomly between 0 & 1
init_w_e = ones(N_input_e, 1)/N_input_e;

%Simulation
T = 60;                             % Length of simulation [s]
dt = 0.01;                          % Timestep [s]
N_cycles = T/dt;                    % number of cycles




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RUN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Whisker trajectory & Tuning curves
t = 0:dt:T;
x = 1.5*cos(t*3)+18.5;  %for now, simple cos between 18.5&20
%Run 
[weights_history_e, error] = run(N_cycles, x, alpha_e, init_w_e, N_input_e);



%%%%%%%%%%%%%%%%%%%%%%%%%%%% RESULT CHECK %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
plot(0:dt:T, x);
figure;
plot(1:1:N_cycles, error);
figure;
plot(1:1:N_cycles, weights_history_e);


%%%%%%%%%%%%%%%%%%%%%%%%%%% ADDITIONAL FUNCTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%