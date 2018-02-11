function kmeans_elbow(dataset) % kmeans under elbow method to find the best number of clusters

clf;
hold on;
for k=1:size(dataset, 1)
	[centroids j] = kmeans(dataset, k, 0);
	scatter(k, j)
end
xlabel('# of clusters (K)');
ylabel('cost function (J)');

endfunction
