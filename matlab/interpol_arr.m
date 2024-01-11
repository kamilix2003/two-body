function [tt, rr] = interpol_arr(r, t, n)
    tt = linspace(t(1), t(end), n);
    rr = interp1(t, r(:, 1:size(r, 2)), tt);
end