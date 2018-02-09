function [centroids] = kmeans(dataset, k)

m = size(dataset, 1);

centroids = zeros(k, 2); % vector of centroids
for i=1:k % random initialize cluster centroids
	random = randi([1 m]);
	centroids(i, :) = dataset(random, :);
end

while true
	c = zeros(m, 1); % vector of cluster assigned to each sample
	for i=1:m % cluster assignment step
		c(i) = nearestCluster(dataset(i, :), centroids, i);
	end

	newCentroids = zeros(k, 2); % vector of new centroids
	for i=1:k % move cluster step
		newCentroids(i, :) =  datasetMean(dataset, c, i);
	end

	if sum(isnan(newCentroids)) != [0 0] % check if there is only 1 cluster and prevent error division by zero in datasetMean function
		break
	elseif newCentroids == centroids % check if clusters are separated accurately and prevent wasting time
		break
	else
		centroids(:, :) = newCentroids(:, :);
	end
	
end

clf;
hold on;
plotData(dataset, c);
plotCentroids(centroids, k)

endfunction
