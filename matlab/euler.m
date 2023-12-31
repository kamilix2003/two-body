function r = euler(func, tspan, h, initial_conditions, m_1, m_2, G)
    r = zeros(round(tspan(2)/h), 12);
    r(1, :) = initial_conditions(:);
    for k = 2:length(r)
        r(k, :) = r(k-1, :) + h .* func(0, r(k-1, :), m_1, m_2, G)';
    end
end