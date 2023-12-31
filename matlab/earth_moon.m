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
tspan = [0 period];
step_size = 1e5;
max_err = 1e9;

%% ODE 45
[t, r] = ode45(@(t, r) base_ode(t, r, mass(1), mass(2), G), tspan(1):step_size:tspan(2), initial_conditions);
figures1 = Results_plots(r, t);

%% Euler method
r = euler(@base_ode, tspan, step_size, initial_conditions, mass(1), mass(2), G);
figures2 = Results_plots(r, t);

%% RK4 method
r = RK4(@base_ode, tspan, step_size, initial_conditions, mass(1), mass(2), G);
figures3 = Results_plots(r, t);

%% Adaptive RK4 method
[t, r]= Adaptive_RK(@base_ode, tspan, max_err, initial_conditions, mass(1), mass(2), G);
figures4 = Results_plots(r, t);

%% Adaptive ODE45
[t, r] = ode45(@(t, r) base_ode(t, r, mass(1), mass(2), G), tspan, initial_conditions, odeset('RelTol',max_err,'AbsTol',max_err));
figures5 = Results_plots(r, t);