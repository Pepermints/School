% Date: 09.10.16 
% By: Tunvez Boulic
% Title: Granule Cell to Purkinje Cell model - learning by gradient descent


clear all

% Parameters
N_input = 10;       %number of input(a.k. Granule cells)
                    %N_output = 1 (Purkinje cell)
N_cycles = 1000;    %number of cycles
alpha = 0.01;       %gradient descent 'speed'

G = rand(N_input, N_cycles) >= 0.5;   % Granule Cells (input) 
P = rand(1, N_cycles) >= 0.5;         % single Purkinje cell 'measured' output 
w = rand(N_input, 1) >= 0.5;          % weight from Granule cells to Purkinje cell

delta_w = w;                          % temporary values at each cycle

for t=1:N_cycles
    error = sum(w.*G(:,t)) - P(1,t);
    delta_w = alpha * error * G(:, t);
    w = w - delta_w;
end