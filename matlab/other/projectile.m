clc; close all; clear all;

%% Constants
G = 6.67430e-11;

mass = [5.9724e24, 100]; %KG
velocity = [0, 5]; %M/S
height = 10;
distance = 6.371e3 + height; %m

r1_0 = [0; 0; 0];
r2_0 = [distance; 0; 0];
v1_0 = [0; 0; 0];
v2_0 = [0; velocity(2); 0];

initial_conditions = [ v1_0, v2_0, r1_0, r2_0];

period = 10;
tspan = [0 period];
step_size = 0.1;
max_err = 1;

[t, r] = euler(@base_ode, tspan, step_size, initial_conditions, mass, G);
plot3(r(6, :), r(9, :), r(11, :))

% %% Euler method
% figures2 = Results_plots(@euler, mass, initial_conditions, tspan, step_size);
% 
% %% RK4 method
% figures3 = Results_plots(@RK4, mass, initial_conditions, tspan, step_size);
% 
% %% Adaptive RK4 method
% figures4 = Results_plots(@Adaptive_RK, mass, initial_conditions, tspan, max_err);