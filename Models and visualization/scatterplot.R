# Sample data
x <- rnorm(100)
y <- rnorm(100)

# Scatter plot
plot(x, y, 
     main = "Scatter Plot in Base R", 
     xlab = "X-axis label", 
     ylab = "Y-axis label", 
     pch = 19,        # Point type
     col = "blue")    # Point color
