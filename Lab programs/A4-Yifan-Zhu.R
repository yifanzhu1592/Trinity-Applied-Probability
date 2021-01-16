result <- 0
for (i in 1:200) {
  sum <- 0
  beta <- 1 / 6
  lambda_exponential <- 1 / 6
  for (j in 1:10000) {
    t <- rexp(1, lambda_exponential)
    lambda_poisson <- beta * t
    p <- ppois(2, lambda_poisson)
    sum <- sum + p
  }
  sum <- sum / 10000
  result <- result + sum
}
result <- result / 200
result



x_axis <- c(1, 2, 3, 4, 5)
y_axis <- c()
for (a in 1:5) {
  result <- 0
  for (i in 1:200) {
    sum <- 0
    for (j in 1:10000) {
      x <- runif(1, 0, a)
      if (x < a / 2) {
        y <- x
      } else {
        y <- a / 2
      }
      sum <- sum + y
    }
    sum <- sum / 10000
    result <- result + sum
  }
  result <- result / 200
  y_axis <- append(y_axis, result)
}
y_axis
plot(x_axis, y_axis)
