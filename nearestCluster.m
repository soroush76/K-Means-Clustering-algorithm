function [cost centroid] = nearestCluster(point, centroids, i)

distances = sqrt(sum((point - centroids).^2, 2));
[cost, centroid] = min(distances);

endfunction
