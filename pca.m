function [z] = pca(dataset)

m = size(dataset, 1);


x_mean = 1/m * sum(dataset);
x_mean(isnan(x_mean)) = 0;
dataset = dataset - x_mean;
%dataset(isnan(dataset(:, i)), i) = x_mean;

sigma = 1/m * dataset' * dataset;

[u s v] = svd(sigma);

Ureduce = u(:, 1:2);
z = dataset * Ureduce;

endfunction
