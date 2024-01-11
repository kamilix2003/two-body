function animation(f, t, r)
    gcf = f;
    gcf.Position(3:4) = [1280 720];
    vid = VideoWriter('orbit');
    vid.FrameRate = 25;
    open(vid)
    m1_radius = 100 * 6.371e6;
    m2_radius = 1.737e6;
    [X, Y, Z] = sphere(100);
    for k = 1:length(t)
        plot3(r(1:k, [7, 10]), r(1:k, [8, 11]), r(1:k, [9, 12]), '--'); hold on; axis equal; grid on;
        mesh(m1_radius .* X + r(k, 7), m1_radius .* Y + r(k, 8), m1_radius .* Z + r(k, 9)); 
        mesh(m2_radius .* X + r(k, 10), m2_radius .* Y + r(k, 11), m2_radius .* Z + r(k, 12)); hold off;
        axis(autoaxis(r(:, 10:12), 0.3))
        drawnow;
        pause(0.01)
        frame = getframe(gcf);
        writeVideo(vid, frame);
    end
    close(vid)
end
