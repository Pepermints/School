% Date: 09.10.16 
% By: Tunvez Boulic
% Title: Granule Cell to Purkinje Cell model - learning by gradient descent


clear all

% Parameters
N_input = 10;       %number of input
N_cycles = 1000;    %number of cycles

G = zeros(N_input, N_cycles);   % Granule Cells (input) 
P = zeros(1, N_cycles);         % single Purkinje cell 'measured' output 
w = zeros(N_input, 1);          % weight from Granule cells to Purkinje cell

delta_w = w;
for t=1:N_cycles
    error = G(:,t)*w - P(:,t);
    
    for i=1:N_input
        delta_w(i,1) = sum( error.*G(:,i));
    end
    
    w = w - delta_w;
end