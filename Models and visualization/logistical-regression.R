patient<-data.frame(age=c(45,32,65,47,56),
                    cholestrol=c(200,170,230,190,150),
                    disease=c(1,0,1,0,1))
patient

model<-glm(disease~age+cholestrol,data=patient,family=binomial())
model
summary(model)

#prediction
new_data=data.frame(age=52,cholestrol=170)
pred<-predict(model,newdata =new_data,type="response" )
pred
################################################################################
mtcars
names(mtcars)

library(caTools)

split=sample.split(mtcars,SplitRatio=0.8)

train_set=subset(mtcars,split==TRUE)
test_set=subset(mtcars,split==FALSE)

model<-glm(vs~wt+disp,data=train_set,family=binomial())
summary(model)

nrow(test_set)
pred<-predict(model,newdata =test_set,type="response" )
pred

#actual class label prediction
pred<-ifelse(pred>0.5,1,0)
#variable<-if else(condition,result_if_condition_true,result_condition_false)
pred

#classification metrics

#1.print confusion matrix
conf_matrix<-table(test_set$vs,pred)
#table(actual values,predicted values)
conf_matrix

#2.accuracy
#acc=1-mean(error)
m<-mean(pred!=test_set$vs)#mean error
print(paste("Accuracy:",1-m))

#acc from conf matrix
acc<-sum(diag(conf_matrix))/sum(conf_matrix)

#3.other metrics
install.packages("Metrics")
library(Metrics)

#recall
print(paste("Recall:",recall(test_set$vs,pred)))

#precision
print(paste("Precision:",precision(test_set$vs,pred)))

#F1 score
print(paste("F1 score:",f1(test_set$vs,pred)))

#accuracy
print(paste("Accuracy:",accuracy(test_set$vs,pred)))

#4.ROC Curve and AUC value
#use pROC package
install.packages("pROC")
library(pROC)
roc_ob<-roc(test_set$vs,pred)
roc_ob
auc_ob <- auc(roc_ob)
print(auc_ob)

plot(roc_ob,col="red")
auc(roc_ob)

#5.sensitivit,specificity
install.packages("caret")
library(caret)
confusionMatrix(conf_matrix)
confusionMatrix(table(test_set$vs,pred))