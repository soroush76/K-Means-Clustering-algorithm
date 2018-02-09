function plotData(dataset, c)

colors_list = ['r', 'b', 'm', 'y', 'k', 'c', 'g']';
shapes_list = ['*', '+', 'o']';

c_idx = 1;
s_idx = 1;

for i=1:size(c, 1)
	plot(dataset(c==i, 1), dataset(c==i, 2), sprintf('%s', colors_list(c_idx, :), shapes_list(s_idx, :)), 'MarkerSize', 10);
	c_idx = c_idx + 1;
	if c_idx == length(colors_list)+1
		c_idx = 1;
		s_idx = s_idx + 1;
	end
end

endfunction
