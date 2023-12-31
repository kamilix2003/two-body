% A - amplitude
% phi1 - angle around Z
% phi2 - angle around XY
function R = PC_translation(A, phi1, phi2)
    X = A .* sin(phi1) .* cos(phi2);
    Y = A .* cos(phi1) .* cos(phi2);
    Z = A .* sin(phi2);
    R = [X, Y, Z];
end