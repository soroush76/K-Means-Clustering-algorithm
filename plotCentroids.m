function plotCentroids(centroids, k, centroids_color_shape)

colors_list = ['r', 'b', 'm', 'y', 'k', 'c', 'g']';
shapes_list = ['*', '+', 'o', 'x']';

for i=1:k % plot data for each cluster centroid
	plot(centroids(i, 1), centroids(i, 2), sprintf('%s', colors_list(centroids_color_shape(i, 1)), shapes_list(centroids_color_shape(i, 2))), 'MarkerSize', 20);
end

endfunction

