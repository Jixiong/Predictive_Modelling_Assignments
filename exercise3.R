library(tree)
library(ISLR)

library(MASS)

head(Carseats)

set.seed(1)
train = sample(1:nrow(Carseats), nrow(Carseats)/2)
tree.Sales=tree(Sales~.,Carseats,subset=train)
summary(tree.Sales)

plot(tree.Sales)
text(tree.Sales,pretty=0)

cv.Sales=cv.tree(tree.Sales)
plot(cv.Sales$size,cv.Sales$dev,type='b')

prune.Sales=prune.tree(tree.Sales,best=10)
plot(prune.Sales)
text(prune.Sales,pretty=0)

attach(Carseats)

Carseats=data.frame(Carseats,High)

Carseats

# Value <- ifelse(medv<20, "Low", ifelse(medv<30,"mid", "HIGH"))



