function figs = Results_plots(method, mass, initial_conditions, tspan, steperr)

    G = 6.67430e-11;
    method_name = ["Adaptive 4th order Runge-Kutta method";
                    "4th order Runge-Kutta method";
                    "Euler method";
                    "none"];
    if isequal(method, @Adaptive_RK) n = 1;
    elseif isequal(method, @RK4) n = 2;
    elseif isequal(method, @euler) n = 3;
    else n = length(method_name) - 1; end

    figs = figure("Name", method_name(n));
    sgtitle(method_name(n));

    tic
    subplot(3, 3, [1, 2, 4, 5])
        [t, r] = method(@base_ode, tspan, steperr, initial_conditions, mass, G);
        r(:, [9, 12]) = r(:, [9, 12])./1e2;
        plot3(r(:, [7, 10]), r(:, [8, 11]), r(:, [9, 12]), '.-'); hold on;
        plot3(r(1, [7, 10]), r(1, [8, 11]), r(1, [9, 12]), 'ko'); hold off;
        grid on; axis equal;
        xlabel('x[m]'); ylabel('y[m]'); zlabel('z[100m]');  
        title("Trajectory"); legend("mass_1", "mass_2", "initial positions")
    toc
    disp("Main plot finished")
    drawnow


    tic
    subplot(3, 3, 3)
        dt = diff(t);
        plot(t(1:end-1), dt);
        grid on;
        title("time step vs time")
        xlabel("time"); ylabel("time step")
    toc
    disp("time step plot finished")
    drawnow

    tic
    subplot(3, 3, 6)
        [test_value, time] = comp_time(method, mass, initial_conditions, tspan);
        semilogx(test_value, time); grid on;
        ylabel("computation time")
        OUT = [test_value; time];
        if ~isequal(method, @Adaptive_RK)
            xlabel("time step [s]")
            title("Computation time vs time step")
        else
            xlabel("tolerance [m]")
            title("Computation time vs tolerance")
        end
    toc
    disp("computation time plot finished")
    drawnow


    tic
    [test_value, err1, err2] = err_test(method, mass, initial_conditions, tspan);
    subplot(3, 3, 7:9)
        loglog(test_value(1:end-1), err1); hold on;
        loglog(test_value(1:end-1), err2); hold on;
        grid on;
        if ~isequal(method, @Adaptive_RK)
            xlabel("time step [s]"); ylabel("change of solution [deg]")
            title("change of solution vs time step")
        else
            xlabel("tolerance"); ylabel("change of solution [deg]")
            title("change of solution vs tolerance")
        end
        legend("mass_1", "mass_2")
    toc
    disp("error plot finished")

end