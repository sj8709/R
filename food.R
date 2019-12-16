food = read.csv("food.csv", stringsAsFactors = F, header = T)
food = food[-1]
head(food)

food.mult = t(as.matrix(food)) %*% as.matrix(food)
food.mult

dist.food = dist(food.mult)
dist.food

two_coord2 = cmdscale(dist.food)
plot(two_coord2, type ="n")
text(two_coord2, rownames(food.mult))