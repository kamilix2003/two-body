function animation(f, t, r)
    gcf = f;
    m1_radius = 6.371e6;
    m2_radius = 1.737e6;
    [X, Y, Z] = sphere(10);
    for k = 1:length(t)
        plot3(r(1:k, [7, 10]), r(1:k, [8, 11]), r(1:k, [9, 12]), '--'); hold on; axis equal; grid on;
        % if k < trace + 1
        %     plot3(r(1:k, [7, 10]), r(1:k, [8, 11]), r(1:k, [9, 12]), '-'); hold on; axis equal; grid on;
        % else 
        %     plot3(r((k-trace):k, [7, 10]), r((k-trace):k, [8, 11]), r((k-trace):k, [9, 12]), '-'); hold on; axis equal; grid on; 
        % end
        mesh(m1_radius .* X + r(k, 7), m1_radius .* Y + r(k, 8), m1_radius .* Z + r(k, 9)); 
        mesh(m2_radius .* X + r(k, 10), m2_radius .* Y + r(k, 11), m2_radius .* Z + r(k, 12)); hold off;
        axis(autoaxis(r(:, 10:12), 0.3))
        drawnow;
        % pause(0.01)
    end
end
