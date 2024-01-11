clc; close all; clear all;

%% Constants
G = 6.67430e-11;

mass = [5.9724e24, 0.07346e24]; %KG
velocity = [29.78e3, 1.022e3]; %M/S
distance = 0.384e9; %m

r1_0 = [0; 0; 0];
r2_0 = [distance; 0; 0];
v1_0 = [0; 0; velocity(1)];
v2_0 = [0; velocity(2); velocity(1)];

initial_conditions = [ v1_0, v2_0, r1_0, r2_0];

period = 708.7 * 60 * 60;
tspan = [0 4*period];
step_size = 1e5;
max_err = 1e8;

%% Euler method
figures2 = Results_plots(@euler, mass, initial_conditions, tspan, step_size);

%% RK4 method
figures3 = Results_plots(@RK4, mass, initial_conditions, tspan, step_size);

%% Adaptive RK4 method
figures4 = Results_plots(@Adaptive_RK, mass, initial_conditions, tspan, max_err);