academy = read.csv("academy.csv", stringsAsFactors = F, header =T)
academy = academy[-1]
dist_academy = dist(academy, method =  "euclidean")

library(cluster)
hcl = hclust(dist(academy)^2, method = "single")
plot(hcl, hang = -1, xlab = "strudent", ylab = "distance")

library(graphics)
kms = kmeans(academy, 5);kms
plot(academy, col = kms$cluster)

wss = 0

for(i in 1:10) wss[i] = sum(kmeans(academy, centers = i)$withinss)

plot(1:10, wss, type="b", xlab = "Number of Clusters", ylab = "Within group sum of squares") 
