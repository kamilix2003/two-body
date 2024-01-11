function o = norm_arr(arr)
    parfor k = 1:length(arr)
        o(k, 1) = norm(arr(k, 1:3));
    end
end