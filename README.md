# K-Means-Clustering-algorithm
K-means clustering algorithm implemented in Matlab
#
There are multiple ways to cluster the data but K-Means algorithm is the most used algorithm. Which tries to improve the inter group similarity while keeping the groups as far as possible from each other.

Basically K-Means runs on distance calculations, which again uses “Euclidean Distance” for this purpose. This algorithm is an iterative process of clustering; which keeps iterating until it reaches the best solution or clusters in our problem space. 
for more technical information of this algorithm visit this website: **https://www.toptal.com/machine-learning/clustering-algorithms**
#
To start working with this algorithm, just follow this pattern in Matlab/Octave environment: `[centroids J] = kmeans(dataset, number_of_clusters);`

Here's a sample run of KMeans algorithm:
![kmeans_result](https://github.com/soroush76/KMeans-Clustering-algorithm/blob/master/kmeans_run.jpg)

I'm using PCA algorithm for dimensionality reduction to plot high-dimensional datasets. Another feature is Elbow method that can help you to choose a better number of clusters, just use this pattern: `[centroids J] = kmeans_elbow(dataset);`
