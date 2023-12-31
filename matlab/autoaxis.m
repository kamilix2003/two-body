function lims = autoaxis(r, margin)
    lims = [min(r(:,1)) + min(r(:,1)) * margin;
            max(r(:,1)) + max(r(:,1)) * margin;
            min(r(:,2)) + min(r(:,2)) * margin;
            max(r(:,2)) + max(r(:,2)) * margin;
            min(r(:,3)) + min(r(:,3)) * margin;
            max(r(:,3)) + max(r(:,3)) * margin;];
end