%% demo1
clear all; close all;
G = 6.67430e-11;

mass = [5.9724e24, 1]; %KG
velocity = [0, 5]; %M/S
R = 6371e3;
r = 10;

r1_0 = [0; 0; 0];
r2_0 = [0; R + r; 0];
v1_0 = [0; 0; 0];
v2_0 = [velocity(2); 0; 0];

initial_conditions = [ v1_0, v2_0, r1_0, r2_0];

tspan = [0 1.45];
h = 0.01;

[t, o1] = euler(@base_ode, tspan, h, initial_conditions, mass, G);
[t, o2] = RK4(@base_ode, tspan, h, initial_conditions, mass, G);

figure(1);
th = 0:pi/1000:2*pi;
xc = R * cos(th);
yc = R * sin(th);
plot(xc, yc); hold on; axis equal; grid on;
plot(o1(:, 10), o1(:, 11));
plot(o2(:, 10), o2(:, 11));
plot(o1(1, 10), o1(1, 11), 'ko'); hold off
ylim([R - r, R + 2*r])
xlim([-10, 20])
legend("", "euler", "RK4")


% f = figure(2);
% f.Position(3:4) = [1280 720];
% vid = VideoWriter('prj_motion');
% vid.FrameRate = 25;
% open(vid)
% 
% for k = 1:length(t)
%     plot(xc, yc); axis equal; grid on; hold on;
%     plot(o1(1:k, 10), o1(1:k,11), "k--");
%     plot(o1(k, 10), o1(k,11), "k."); hold off;
%     ylim([R - r, R + 2*r])
%     xlim([-10, 20])
%     pause(0.01);
%     frame = getframe(gcf);
%     writeVideo(vid, frame);
% end
% close(vid)

%% demo2
clear all;
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
h = 1e5;

[t, o1] = euler(@base_ode, tspan, h, initial_conditions, mass, G);
[t, o2] = RK4(@base_ode, tspan, h, initial_conditions, mass, G);
o1(:, [9, 12]) = o1(:, [9, 12])./1e2;
o2(:, [9, 12]) = o2(:, [9, 12])./1e2;
% r = o2;
% f = figure(3);
% f.Position(3:4) = [1280 720];
% vid = VideoWriter('orbit2');
% vid.FrameRate = 25;
% open(vid)
% m1_radius = 10 * 6.371e6;
% m2_radius = 10 * 1.737e6;
% [X, Y, Z] = sphere(100);
% for k = 1:length(t)
%     plot3(r(1:k, [7, 10]), r(1:k, [8, 11]), r(1:k, [9, 12]), '--'); hold on; axis equal; grid on;
%     mesh(m1_radius .* X + r(k, 7), m1_radius .* Y + r(k, 8), m1_radius .* Z + r(k, 9)); 
%     mesh(m2_radius .* X + r(k, 10), m2_radius .* Y + r(k, 11), m2_radius .* Z + r(k, 12)); hold off;
%     axis(autoaxis(r(:, 10:12), 0.3))
%     drawnow;
%     pause(0.01)
%     frame = getframe(gcf);
%     writeVideo(vid, frame);
% end
% close(vid)