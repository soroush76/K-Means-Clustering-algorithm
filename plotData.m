function [centroids_color_shape] = plotData(dataset, c, k)

colors_list = ['r', 'b', 'm', 'y', 'k', 'c', 'g']';
shapes_list = ['*', '+', 'o', 'x']';

c_idx = 1;
s_idx = 1;
centroids_color_shape = zeros(k, 2);

for i=1:k % plot data for each sample in data-set
	if sum(unique(c)==i) % check if a cluster has at least one data assigned to it and plot that cluster samples
		plot(dataset(c==i, 1), dataset(c==i, 2), sprintf('%s', colors_list(c_idx, :), shapes_list(s_idx, :)), 'MarkerSize', 5);
		centroids_color_shape(i, :) = [c_idx s_idx];
		c_idx = c_idx + 1;
		if c_idx == length(colors_list)+1
			c_idx = 1;
			s_idx = s_idx + 1;
		end
	else % if there is not any sample in cluster, just reserve a color and shape for the cluster centroid 
		centroids_color_shape(i, :) = [c_idx s_idx];
		c_idx = c_idx + 1;
		if c_idx == length(colors_list)+1
			c_idx = 1;
			s_idx = s_idx + 1;
		end
	end
end

endfunction
