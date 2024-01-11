function [test_value, dr1, dr2] = err_test(method, mass, initial_conditions, tspan)
    G = 6.67430e-11;
    n = 5e4;   
    test_value = logspace(14, 3, 200);
    parfor k = 1:length(test_value)
        [temp1, temp2] = method(@base_ode, tspan, test_value(k), initial_conditions, mass, G);
        [tt, R(:, :, k)] = interpol_arr(temp2, temp1, n);
    end
    parfor k = 2:(length(test_value) - 1)
        norm1 = [norm_arr(R(:, 7:9, k)), norm_arr(R(:, 7:9, k - 1))];
        norm2 = [norm_arr(R(:, 10:12, k)), norm_arr(R(:, 10:12, k - 1))];
        dr1(k) = dot(norm1(:, 1), norm1(:, 2)) ./ (norm(norm1(:, 1)) .* norm(norm1(:, 2)));
        dr1(k) = abs(acos(dr1(k)));
        dr2(k) = dot(norm2(:, 1), norm2(:, 2)) ./ (norm(norm2(:, 1)) .* norm(norm2(:, 2)));
        dr2(k) = abs(acos(dr2(k)));
    end
end