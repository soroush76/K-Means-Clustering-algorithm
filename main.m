csvfile = textscan (fopen('dataset2'), '%s%f%f%f%f%f%f%f%f%f%f', 'delimiter', ',');
dataset = [csvfile{2} csvfile{3} csvfile{4} csvfile{5} csvfile{6} csvfile{7} csvfile{8} csvfile{9} csvfile{10} csvfile{11}];

[c j] = kmeans(dataset(1:100, 2:3), 3);
