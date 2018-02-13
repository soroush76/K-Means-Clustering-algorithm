function [X_reduced, best_k] = pca(dataset, k)

m = size(dataset, 1);
d = size(dataset, 2);

x_mean = 1/m * sum(dataset);
x_mean(isnan(x_mean)) = 0;
dataset = dataset - x_mean;

sigma = 1/m * dataset' * dataset;

[u s v] = svd(sigma);

U_reduce = u(:, 1:k);
X_reduced = dataset * U_reduce;

% find the best final dimension after reducing the dimensions
test_k = 1;
while true
	sum_s_k = 0;
	sum_s_d = 0;
	for i=1:test_k
		sum_s_k = sum_s_k + s(i,i);
	end
	for i=1:d
		sum_s_d = sum_s_d + s(i,i);
	end
	percent = sum_s_k/sum_s_d;
	if percent >= 0.99
		best_k = test_k;
		break
	end
	test_k = test_k + 1;
end

endfunction
