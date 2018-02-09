# K-Means-Clustering-algorithm
K-means clustering algorithm implemented in Matlab
#
There are multiple ways to cluster the data but K-Means algorithm is the most used algorithm. Which tries to improve the inter group similarity while keeping the groups as far as possible from each other.

Basically K-Means runs on distance calculations, which again uses “Euclidean Distance” for this purpose. This algorithm is an iterative process of clustering; which keeps iterating until it reaches the best solution or clusters in our problem space. 
for more technical information of this algorithm visit this website: **https://www.toptal.com/machine-learning/clustering-algorithms**
#
To start working woth this algorithm, just follow this pattern in Matlab/Ocvate enviroment: `centroids = kmeans(dataset, number_of_clusters);`
