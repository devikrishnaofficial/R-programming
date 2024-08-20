install.packages("tidyverse")
library(tidyverse)

market_basket <- list(c("apple", "beer", "rice", "meat"),
                      c("apple", "beer", "rice"),
                      c("apple", "beer"),
                      c("apple", "pear"),
                      c("milk", "beer", "rice", "meat"),
                      c("milk", "beer", "rice"),
                      c("milk", "beer"),
                      c("milk", "pear"))
print(market_basket)

#set transaction names t1 to t8
names(market_basket)<-paste(T,c(1:8),sep="")

#print the names
names(market_basket)

install.packages("arules") #for rules
install.packages("arulesViz") #for visualizing the rules
library(arules)
library(arulesViz)

#converting list into transaction class
trans<-as(market_basket,"transactions")

#print
trans
dim(trans)

itemLabels(trans) #listing the items
summary(trans)
image(trans)
itemFrequencyPlot(trans,topN=10)

#actual implementation of apriori algorithm
rules<-apriori(trans,parameter=list(supp=0.3,maxlen=10,target="rules"))
summary(rules)

#inspect the rules
inspect(rules)

#analyse rules of specific item
beer_rules_rhs<-apriori(trans,parameter=list(supp=0.3,maxlen=10,minlen=2),appearance=list(default="lhs",rhs="beer"))
summary(beer_rules_rhs)

beer_rules_lhs<-apriori(trans,parameter=list(supp=0.3,maxlen=10,minlen=2),appearance=list(default="rhs",lhs="beer"))
summary(beer_rules_lhs)

#visualization
#1.scatterplot
plot(rules)
plot(rules,measure="confidence")
plot(rules,method="two-key plot")

#2.interactive scatterplot
install.packages("plotly")
library(plotly)
plot(rules,engine="plotly")

#3.graph based visualization
install.packages("htmlwidgets")
library(htmlwidgets)
subrules<-head(rules,n=10,by="confidence")
plot(subrules,method="graph",engine="htmlwidget")

#4.parallel coordinate plot
plot(subrules,method="paracoord")

