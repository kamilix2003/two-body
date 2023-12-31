function figs = Results_plots(r, t)
    k = 1;
    r(:, [9, 12]) = r(:, [9, 12])./1e2;
    figs(k) = figure();
        plot3(r(:, [7, 10]), r(:, [8, 11]), r(:, [9, 12]), '.-');
        grid on; axis equal;
        xlabel('x'); ylabel('y'); zlabel('z');  
    dt = diff(t);
    if dt(1) ~= dt(10)
        figs(k+1) = figure();
        plot(dt);
    end
end