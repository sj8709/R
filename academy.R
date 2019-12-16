academy <- read.csv("academy.csv", stringsAsFactors = F, header = T)
head(academy)
academy <- academy[-1]
head(academy)

dist_academy <- dist(academy, method = "euclidean")
dist_academy

two_coord <- cmdscale(dist_academy)
plot(two_coord, type = "n")
text(two_coord, as.character(1:52))
