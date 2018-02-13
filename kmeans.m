function [centroids, J] = kmeans(raw_dataset, k, showplot) % k is the number of clusters

if size(raw_dataset, 2) > 2
	dataset = pca(raw_dataset, 2);
else
	dataset = raw_dataset;
end

m = size(dataset, 1);

first_time = true;

for iter=1:100
	oldCentroids = zeros(k, 2); % vector of centroids
	for i=1:k % random initialize cluster centroids
		random = randi([1 m]);
		oldCentroids(i, :) = dataset(random, :);
	end

	cost = zeros(m, 1);

	while true
		c = zeros(m, 1); % vector of cluster assigned to each sample
		for i=1:m % cluster assignment step
			[cost(i) c(i)] = nearestCluster(dataset(i, :), oldCentroids, i);
		end

		newCentroids = zeros(k, 2); % vector of new centroids
		for i=1:k % move cluster step
			newCentroids(i, :) =  datasetMean(dataset, c, i);
		end

		if sum(sum(isnan(newCentroids))) != 0 % check if there is only 1 cluster and prevent error division by zero in datasetMean function
			break
		elseif newCentroids == oldCentroids % check if clusters are separated accurately and prevent wasting time
			break
		else
			oldCentroids(:, :) = newCentroids(:, :);
		end
	end

	J_cost = sum(sum(cost)) / m;

	if first_time
		first_time = false;
		J = J_cost;
		centroids(:, :) = oldCentroids(:, :);
	else
		if J > J_cost
			J = J_cost;
			centroids(:, :) = oldCentroids(:, :);
		end
	end
end

% plot the final result
if k <= 28 && nargin<3 % because we have only 28 combinations of colors and shapes for plotting
	clf;
	hold on;
	centroids_color_shape = plotData(dataset, c, k);
	plotCentroids(centroids, k, centroids_color_shape);
	xlabel('Year');
	ylabel('# of Passengers');	
end

endfunction
