x<-c(1,3,5,7,9)#independent var
y<-c(2,5,4,8,12)#dependent var
model<-lm(y~x)#LR with command
plot(x,y)#plot
abline(model,col="blue")#plotting line
coef(model)#coefficient

#prediction
new_x<-7
prediction<-predict(model,newdata=data.frame(x=new_x))
print(prediction)
summary(model)
############################################################################
mtcars
names(mtcars)
model<-lm(mpg~hp,data=mtcars)
plot(mtcars$mpg,mtcars$hp)
abline(model,col="red")

library(ggplot2)
ggplot(mtcars,aes(mpg,hp))+geom_point()+geom_smooth(method="lm",col="red")
coef(model)
summary(model)

#prediction
new_hp=150
pred=predict(model,newdata=data.frame(mpg=new_hp))
pred
###########################################################################
library(MASS)
Boston
model<-lm(lstat~medv,data=Boston)
plot(Boston$lstat,Boston$medv)
library(ggplot2)
ggplot(Boston,aes(lstat,medv))+geom_point()+geom_smooth(method="lm",col="red")
summary(model)

#prediction
new_lstat=5.68
pred=predict(model,newdata=data.frame(medv=new_lstat))
pred