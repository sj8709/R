prob = read.csv("problem.csv", header = T, stringsAsFactors = F)
head(prob)

for(i in 1:30) {
  prob[i] = prob[i] * (1/5)
}
head(prob)

normalize = function(x) {
  return((x-min(x)) / diff(range(x)))
}

sigmoid = function(x) {
  return(1 / (1+ exp(-x)))
}

prob$accident2 = with(prob, ifelse(accident == "suicide" | accident=="violence", 1, 0))


head(prob)

library(nnet)
prob = prob[-31]
prob
m1 = nnet(accident2 ~ . , data = prob , size = 10)
m1
r1 = predict(m1, prob)
head(r1)

cbind(prob$accident2, r1>0.5)
sum(as.numeric(r1>0.5) != prob$accident2)

install.packages('neuralnet')
library(neuralnet)
xnam = paste0("ans", 1:30)
xnam
fmla = as.formula(paste("accident2 ~ ", paste(xnam, collapse = "+")))
m2 = neuralnet(fmla, data = prob, hidden = 10)
plot(m2)
