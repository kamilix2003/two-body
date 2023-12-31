function dydt = base_ode(t, r, m_1, m_2, G)
    r_0 = r(10:12) - r(7:9);
    abs_r_0 = norm(r_0);
    vx1 = G .* m_2 .* r_0(1) ./ abs_r_0 .^3;
    vy1 = G .* m_2 .* r_0(2) ./ abs_r_0 .^3;
    vz1 = G .* m_2 .* r_0(3) ./ abs_r_0 .^3;
    vx2 = - G .* m_1 .* r_0(1) ./ abs_r_0 .^3;
    vy2 = - G .* m_1 .* r_0(2) ./ abs_r_0 .^3;
    vz2 = - G .* m_1 .* r_0(3) ./ abs_r_0 .^3;
    dydt(7:12) = r(1:6);
    dydt(1:6) = [vx1, vy1, vz1, vx2, vy2, vz2];
    dydt = dydt';
end