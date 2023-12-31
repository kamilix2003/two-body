clc; close all;

G = 6.67430e-11;
% Earth
mass_earth = 5.9724e24; %Kg
v_earth = 107e3;

% Earth's moon
mass_moon = 0.07346e24;  %kg
d_moon_earth = 0.384e9; %m
v_moon = 1.022e3; %m/s
period = 708.7 * 60 * 60;
r1_0 = [0; 0; 0];
r2_0 = [d_moon_earth; 0; 0];
v1_0 = [0; 0; 0];
v2_0 = [0; v_moon; 0];
initial_conditions = [ v1_0, v2_0, r1_0, r2_0];
tspan = [0 period];
[t, r] = ode45(@(t, r) ode(t, r, mass_earth, mass_moon, G), tspan, initial_conditions);

figure;
    plot3(r1_0(1), r1_0(2), r1_0(3), 'bo'); hold on;
    plot3(r2_0(1), r2_0(2), r2_0(3), 'ro');
    plot3(r(:, [7, 10]), r(:, [8, 11]), r(:, [9, 12]), '.-');
    grid on; axis equal;
    xlabel('x'); ylabel('y'); zlabel('z');

function dydt = ode(t, r, m_1, m_2, G)
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