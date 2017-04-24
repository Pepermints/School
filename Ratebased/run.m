function [ weights_history_e, error_history, G_tuningcurve] = run(N_cycles, x, alpha_e, init_w_e, N_input_e);

    w_e = init_w_e;
    weights_history_e = zeros(N_input_e, N_cycles);
    error_history = zeros(1, N_cycles);

    G_tuningcurve = getTuningCurves(x, N_input_e);

    for t=2:N_cycles  
%         if t < 2
%             getInputActivity(x(t), G_tuningcurve, N_input_e)
%         end
        G = getInputActivity(x(t), G_tuningcurve, N_input_e);
        P = getPurkinjeActivity(x(t));
        
        %[w_e, error] = gradientDescent(w_e, alpha_e, G, P);
        error = sum(w_e.*G) - P;

        w_e = w_e - alpha_e * error * G;
        w_e = w_e.* (w_e > 0);    %lower boundary at 0 
    
        weights_history_e(:,t) =  w_e;
        error_history(1, t) = error;
    end
    
    %bar(getInputActivity(x(2), G_tuningcurve, N_input_e));
end


%%%%%%%% - Additional functions - %%%%%%%%

function [ activity ] = getInputActivity(position, tuningcurve, N_input);
    activity = zeros(N_input, 1);
    for i = 1:N_input
        activity(i) = gaussmf(position, [0.005 tuningcurve(i)]);    
    end
end

function [centers] = getTuningCurves(x, N_input);
    %gives back the centers of the gaussian function gaussmf()
    %centers = min(x) + (0:1:(N_input-1))*(max(x)-min(x))/(N_input-1);
    centers = -0.5 + (0:1:(N_input-1))*(1.5+0.5)/(N_input-1);
end

function [ P ] = getPurkinjeActivity(position);
    %based on fig. 3, Chen et al, eLife 2016
    P = position;
end