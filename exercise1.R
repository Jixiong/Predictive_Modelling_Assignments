require(CORElearn)
require(e1071)
require(MASS) 
require(ISLR) 
require(ggplot2)
require(GGally)

summary(Auto)
summary(Carseats)

Auto

plot(Auto)
plot(Carseats)
str(Auto)
str(Carseats)

help(Auto)

class(Auto)

Auto$name <- NULL

Auto

GGally::ggpairs(Auto)

names(Boston)

lm.fit=lm(medv~lstat,data=Boston)
lm.fit

str(Carseats)

lm.fit=lm(Sales~.+Income:Advertising + Income:Population + Income:Urban + ShelveLoc : US, data=Carseats)
summary(lm.fit)

lm.fit=lm(Sales~.+CompPrice*Income*Advertising*Population*Price*ShelveLoc*Age*Education*Urban, data=Carseats)
summary(lm.fit)


help("Carseats")

Auto

# sample 函数

