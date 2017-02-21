function [ weights_fin_e,  weights_fin_i] = gradientDescent( weights_init_e, alpha_e, G, weights_init_i, alpha_i, I, P, firingThreshold)
%description: calculates the weights for 1 cycle

    error = (sum(weights_init_e.*G)+ sum(weights_init_i.*I) >= firingThreshold) - P;

    weights_fin_e = weights_init_e - alpha_e * error * G;
    weights_fin_i = weights_init_i - alpha_i * error * I;
end

