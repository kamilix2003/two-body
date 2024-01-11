function [t, r] = euler(func, tspan, h, initial_conditions, mass, G)
    k = 1; t(k) = 0;
    r = zeros(round(tspan(2)/h), 12);
    r(1, :) = initial_conditions(:);
    for k = 2:length(r)
        t(k) = t(k-1) + h;
        r(k, :) = r(k-1, :) + h .* func(0, r(k-1, :), mass(1), mass(2), G)';
    end
end