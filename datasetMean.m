function [newCentroid] = datasetMean(dataset, c, i)
	
data = dataset(c==i, :);

if size(data, 1) == 0 % check if there is only 1 cluster and prevent error division by zero
	newCentroid = nan(1, size(data, 2));
	return
end

newCentroid = sum(data) ./ size(data, 1);

endfunction
