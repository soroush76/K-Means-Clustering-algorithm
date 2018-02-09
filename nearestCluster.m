function [cluster] = nearestCluster(point, centroids, i)

distances = sqrt(sum((point - centroids).^2, 2));

[item, cluster] = min(distances);

endfunction
