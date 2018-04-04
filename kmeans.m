function [centroids, c, J] = kmeans(dataset, k) % k is the number of clusters

m = size(dataset, 1);

first_time = true;

for iter=1:100
	oldCentroids = zeros(k, size(dataset, 2)); % vector of centroids
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

		newCentroids = zeros(k, size(dataset, 2)); % vector of new centroids
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
dataset = pca(dataset, 2);
clf;
hold on;
centroids_color_shape = plotData(dataset, c, k);
plotCentroids(centroids, k, centroids_color_shape);

endfunction
