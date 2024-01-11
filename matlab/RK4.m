function [t, r] = RK4(func, tspan, h, initial_conditions, mass, G)
    k = 1; t(k) = 0;
    r = zeros(round(tspan(2)/h), 12);
    r(1, :) = initial_conditions(:);
    for k = 2:length(r)
        t(k) = t(k-1) + h;
        k_1 = func(0, r(k-1, :), mass(1), mass(2), G)';
        k_2 = func(0, r(k-1, :) + h .* k_1 ./2 , mass(1), mass(2), G)';
        k_3 = func(0, r(k-1, :) + h .* k_2 ./2 , mass(1), mass(2), G)';
        k_4 = func(0, r(k-1, :) + h .* k_3, mass(1), mass(2), G)';
        r(k, :) = r(k-1, :) + h ./ 6 .* (k_1 + 2.*k_2 + 2.*k_3 + k_4);
    end
end