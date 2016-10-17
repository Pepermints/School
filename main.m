% Date: 09.10.16 
% By: Tunvez Boulic
% Title: Granule Cell to Purkinje Cell model - learning by gradient descent


clear all

% Parameters
N_input = 10;       %number of input(a.k. Granule cells)
N_cycles = 2000;    %number of cycles
N_patterns = 3;     %number of patterns
alpha = 0.01;       %gradient descent 'speed'

% Patterns generation
G = rand(N_input, N_patterns) >= 0.5;       % Granule Cells (input) 
P = rand(1, N_patterns) >= 0.5;             % single Purkinje cell 'measured' output 

% Initial values                        
w = ones(N_input, 1) * 0.5;                 % initial weight from Granule cells to Purkinje cell
weights_history = w;

% Run the cycles
patterns = randi([1 3], 1, N_cycles);       % pattern occurences
for t=1:N_cycles
    w = gradientDescent(w, alpha, G(:, patterns(t)), P(1, patterns(t)));
    weights_history = [weights_history, w];
end

%Testing
plot(0:N_cycles, weights_history);
error_1 = sum(w.*G(:, 1)) - P(1, 1) 
error_2 = sum(w.*G(:, 2)) - P(1, 2)
error_3 = sum(w.*G(:, 3)) - P(1, 3)