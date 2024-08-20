dataframe<-data.frame(
  "Name"=c("a","b","c"),
  "Age"=c(20,23,NA),
  "Rollno"=c(1,2,NA)
)
dataframe

is.na(dataframe)
#identify the missing value
mean(dataframe$Age,na.rm = TRUE)

#get the number of missing values
count<-sum(is.na(dataframe))
count
#get the number of non missing values
counts<-sum(!is.na(dataframe))
counts

#to replace missing values
#we use the package Hmsic
install.packages("Hmisc")
library(Hmisc)
impute(dataframe$Age,mean)
dfcleaned <- as.data.frame(lapply(dataframe, function(x) impute(x, mean)))

#name of columns
colnames(dataframe)
names(dataframe)
#to change the column name
colnames(dataframe)<-paste("Column",1:ncol(dataframe))
colnames(dataframe)

install.packages("tidyr")
library(tidyr)
data=data.frame(
  "id"=c(1,2,3),
  "maths"=c(80,85,90),
  "science"=c(75,88,95)
)
data

#to make data into longer format we can use gather function
long<-gather(data,key="subject",value="score",maths,science)
long

#to make it wider format
wide<-spread(long,key="subject",value="score")
wide

#how to make  column into sperate colum
data1=data.frame(
  id=c(1,2),
  fullname=c("John Smith","James Augustine")
)
data1
sep=separate(data1,fullname ,into=c("firstname","lastname"),sep=" ")
sep

#merge it back
merged_data <- unite(sep, fullname, firstname, lastname, sep = " ")

