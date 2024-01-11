function [test_value, T] = comp_time(method, mass, initial_conditions, tspan)
    G = 6.67430e-11;
    test_value = logspace(1, 14, 100);
    parfor k = 1:length(test_value)
        tic
        method(@base_ode, tspan, test_value(k), initial_conditions, mass, G);
        T(k) = toc;
    end
end