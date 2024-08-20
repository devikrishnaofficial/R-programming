# Sample data
slices <- c(10, 20, 30, 40)
labels <- c("A", "B", "C", "D")

# Pie chart
pie(slices, labels = labels, col = rainbow(length(slices)), 
    main = "Simple Pie Chart")

