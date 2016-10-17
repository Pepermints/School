function [ weights_fin ] = gradientDescent( weights_init, alpha, G, P)
%description: calculates the weights for 1 cycle

    error = sum(weights_init.*G) - P;
    delta_w = alpha * error * G;
    weights_fin = weights_init - delta_w;

end

