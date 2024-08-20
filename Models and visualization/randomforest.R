
install.packages("randomForest")
library(randomForest)
data("iris")
head(iris)

library(caTools)
sp=sample.split(iris,SplitRatio=0.8)
train_set=subset(iris,sp==TRUE)
test_set=subset(iris,sp==FALSE)
model<-randomForest(Species~.,data=train_set,ntree=500 )
model
pred<-predict(model,newdata=test_set,type="class")
pred
