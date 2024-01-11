function e = Accumulation_error(r, t)
d = zeros(size(r));
e = zeros(size(r));
for k = 2:(length(r)-1)
    d(k, :) = abs((r(k, :) - r(k-1, :)));
    e(k-1, :) = d(k-1, :) + d(k, :);
end
end