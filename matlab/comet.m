clc; close all; clear all

%% Constants
G = 6.67430e-11;

% Earth
mass_earth = 5.972e24; %Kg
v_earth = 29.78e3; %m/s

% Earth's moon
mass_comet = 1e14;  %kg
d_earth_comet = 2e6; %m
v_comet = 35e3; %m/s

% r1_0 = [0; 0; 0];
% r2_0 = [d_earth_comet; 0; 0];
% v1_0 = [0; v_earth; 0];
% v2_0 = [0; v_comet; 0];
r1_0 = PC_translation(0, 0, 0);
r2_0 = PC_translation(d_earth_comet, 0, 0);
v1_0 = PC_translation(v_earth, pi/2, pi/6);
v2_0 = PC_translation(v_comet, pi/2, 0);
initial_conditions = [ v1_0, v2_0, r1_0, r2_0];

period = 1e3;
tspan = [0 period];
step_size = 1e3;

%% ODE 45
[t, r] = ode45(@(t, r) base_ode(t, r, mass_earth, mass_comet, G), tspan, initial_conditions);

figure('Name', 'ODE45 solution');
    plot3(r1_0(1), r1_0(2), r1_0(3), 'bo'); hold on;
    plot3(r2_0(1), r2_0(2), r2_0(3), 'ro');
    plot3(r(:, [7, 10]), r(:, [8, 11]), r(:, [9, 12]), '.-');
    grid on; axis equal;
    xlabel('x'); ylabel('y'); zlabel('z');

% gcf = animation(t, r);

%% Euler's method
r = euler(@base_ode, tspan, step_size, initial_conditions, mass_earth, mass_comet, G);

figure('Name', 'Euler solution');
    plot3(r1_0(1), r1_0(2), r1_0(3), 'bo'); hold on;
    plot3(r2_0(1), r2_0(2), r2_0(3), 'ro');
    plot3(r(:, [7, 10]), r(:, [8, 11]), r(:, [9, 12]), '.-');
    grid on; axis equal;
    xlabel('x'); ylabel('y'); zlabel('z');  

%% RK4 method
r = RK4(@base_ode, tspan, step_size, initial_conditions, mass_earth, mass_comet, G);

figure('Name', 'Runge-Kutta solution');
    plot3(r1_0(1), r1_0(2), r1_0(3), 'bo'); hold on;
    plot3(r2_0(1), r2_0(2), r2_0(3), 'ro');
    plot3(r(:, [7, 10]), r(:, [8, 11]), r(:, [9, 12]), '.-');
    grid on; axis equal;
    xlabel('x'); ylabel('y'); zlabel('z');  
