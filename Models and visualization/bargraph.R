install.packages("ggplot2")
library(ggplot2)
# Sample data
categories <- c("A", "B", "C", "D")
values <- c(4, 7, 9, 6)
data <- data.frame(categories, values)

# Bar graph
ggplot(data, aes(x = categories, y = values)) +
  geom_bar(stat = "identity", fill = "blue") +
  ggtitle("Simple Bar Graph") +
  xlab("Categories") +
  ylab("Values")
