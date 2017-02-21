function [ weights_history_e, weights_history_i, error ] = run(N_cycles, firingThreshold, N_patterns, P, G, alpha_e, init_w_e, I, alpha_i, init_w_i)

    w_e = init_w_e; w_i = init_w_i;
    weights_history_e = init_w_e; weights_history_i = init_w_i;

    % Run the cycles
    patterns = randi([1 N_patterns], 1, N_cycles);       % pattern occurences
    
    for t=1:N_cycles
        [w_e, w_i] = gradientDescent(w_e, alpha_e, G(:, patterns(t)), w_i, alpha_i, I(:, patterns(t)), P(1, patterns(t)), firingThreshold);
        weights_history_e = [weights_history_e, w_e];
        weights_history_i = [weights_history_i, w_i];
    end

    %Testing
    error = zeros(1, N_patterns);
    for i = 1:N_patterns
        error(1, i) = ( sum(w_e.*G(:, i)) + sum(w_i.*I(:, i))>= firingThreshold) - P(1, i);
    end  
end

