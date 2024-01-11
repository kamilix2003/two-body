function [test_value, T] = comp_time(method, mass, initial_conditions, tspan)
    G = 6.67430e-11;
    % tspan = [0, 1e6];
    
    if ~isequal(method, @Adaptive_RK)
        test_value = logspace(1, 14, 100);
    else
        test_value = logspace(7, 11, 50);
    end
    

    parfor k = 1:length(test_value)
        tic
        method(@base_ode, tspan, test_value(k), initial_conditions, mass, G);
        T(k) = toc;
    end
end