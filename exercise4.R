library(tree)
library(ISLR)
library(MASS)
library(CORElearn)

head(Boston)
attach(Boston)

Value <- ifelse(medv<20, "Low", ifelse(medv<30,"Mid", "High"))

TBoston=data.frame(Boston,Value)

head(TBoston)

data <- TBoston
folds <- 20
foldIdx <- cvGen(nrow(TBoston), k=folds)

CA<-list()
K <-list()

for (j in 1:folds) {
  dTrain <- data[foldIdx!=j,]
  dTest  <- data[foldIdx==j,]
  
  tree.carseats=tree(Value~.-medv,dTrain)
  for (i in 1:20){
    set.seed(1)
    knn.pred=knn(train.X,test.X,train.Direction,k=i)
    result[i] <- mean(knn.pred==Direction.2005)
  }
  
  
  tree.pred=predict(tree.carseats,dTest, type="class")
  
  cm <- table(tree.pred,Value[foldIdx==j])
  CA[j] <- sum(diag(cm))/sum(cm)
}

mean(CA)
CA[best]


dTrain <- data[foldIdx!=best,]
dTest  <- data[foldIdx==best,]

tree.carseats=tree(Value~.-medv,dTrain)
tree.pred=predict(tree.carseats,dTest, type="class")
