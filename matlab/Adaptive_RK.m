function [t, r] = Adaptive_RK(func, tspan, max_err, initial_conditions, mass, G)
    k = 1; t(k) = 0; h = eps; 
    r(1, :) = initial_conditions(:);
    while t < tspan(2)
        k = k + 1;
        while 1
            k_1 = func(0, r(k-1, :), mass(1), mass(2), G)';
            k_2 = func(0, r(k-1, :) + h .* k_1 ./2 , mass(1), mass(2), G)';
            k_3 = func(0, r(k-1, :) + h .* k_2 ./2 , mass(1), mass(2), G)';
            k_4 = func(0, r(k-1, :) + h .* k_3, mass(1), mass(2), G)';
            r(k, :) = r(k-1, :) + h ./ 6 .* (k_1 + 2.*k_2 + 2.*k_3 + k_4);
            e = max([abs(norm(r(k, 7:9)) - norm(r(k - 1, 7:9))), abs(norm(r(k, 10:12)) - norm(r(k - 1, 10:12)))]);
            h = 0.97 .* h .* (max_err./e).^(1/5);
            if e < max_err
                break;
            end     
        end
        t(k) = t(k-1) + h;
    end
end