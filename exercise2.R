library(ISLR)
attach(Smarket)
require(class)
require(ggplot2)
require(GGally)

train=(Year<2005)
Smarket.2005=Smarket[!train,]

Smarket.2005

dim(Smarket.2005)

train.X=cbind(Lag1,Lag2)[train,]
test.X=cbind(Lag1,Lag2)[!train,]
train.Direction=Direction[train]

Direction.2005=Direction[!train]

result <- list()


for (i in 1:200){
  set.seed(1)
  knn.pred=knn(train.X,test.X,train.Direction,k=i)
  result[i] <- mean(knn.pred==Direction.2005)
}

plot(1:200,result)
  
