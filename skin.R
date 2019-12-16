skin = read.csv("skin.csv", header = T)
skin = skin[-1]

library(rpart)
tree1 = rpart(쿠폰반응여부 ~ . , data = skin, control=rpart.control(minsplit = 2))
plot(tree1, compress = T, uniform = T, margin=0.1)
text(tree1, use.n=T, col="blue")