# kmeans(x,centers,iter.max=10)

data("USArrests")
names(USArrests)
head(USArrests)

#assign this to dataframe
df<-USArrests
#remove rows with missing values
df<-na.omit(df)
df<-scale(df)
df

install.packages("factoextra")
library(factoextra)

#Elbow test :to find optimal number of cluster
fviz_nbclust(df,kmeans,method="wss")
#wss-within cluster sum of square

#implement kmeans algorithm usung kmeans()
set.seed(123)
km<-kmeans(df,centers=4,nstart=25)

#view results
km
km$cluster
km$centers

#plot result 1
fviz_cluster(km,data=df)

#plot result2
install.packages("ggfortify")
library(ggfortify)
autoplot(km,df,frame=TRUE)

#mean of each cluster
aggregate(USArrests,by=list(cluster=km$cluster),mean)
df<- cbind(df, cluster = km$cluster)
df