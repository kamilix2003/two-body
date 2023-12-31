function r = RK4(func, tspan, h, initial_conditions, m_1, m_2, G)
    r = zeros(round(tspan(2)/h), 12);
    r(1, :) = initial_conditions(:);
    for k = 2:length(r)
        k_1 = func(0, r(k-1, :), m_1, m_2, G)';
        k_2 = func(0, r(k-1, :) + h .* k_1 ./2 , m_1, m_2, G)';
        k_3 = func(0, r(k-1, :) + h .* k_2 ./2 , m_1, m_2, G)';
        k_4 = func(0, r(k-1, :) + h .* k_3, m_1, m_2, G)';
        r(k, :) = r(k-1, :) + h ./ 6 .* (k_1 + 2.*k_2 + 2.*k_3 + k_4);
    end
end