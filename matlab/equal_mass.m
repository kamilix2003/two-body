clc; close all; clear all

%% Constants
G = 6.67430e-11;

mass = [0.641, 0.641] .* 1e24; %KG
r_0 = 1e8; %m
v = [1 1.1] .* 1e2; %m/s

r1_0 = [0; 0; 0];
r2_0 = [r_0; r_0; 0];
v1_0 = [0; v(2); 1e2];
v2_0 = [0; v(1); 0];
initial_conditions = [ v1_0, v2_0, r1_0, r2_0];

period = 1e6;
tspan = [0 period];
step_size = 100;
max_err = 1e4;


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
[t, r] = ode45(@(t, r) base_ode(t, r, mass(1), mass(2), G), tspan, initial_conditions, odeset('RelTol',1e-5,'AbsTol',1e-5));
figures5 = Results_plots(r, t);
