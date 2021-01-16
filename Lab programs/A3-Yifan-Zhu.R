x_axis <- c(2, 3, 4, 5)
y_axis <- c()
for (k in 2:5) {
  result <- 0
  for (i in 1:200) {
    sum <- 0
    for (j in 1:10000) {
      y <- rexp(k, rate = 1/24000)
      T1 <- y[1]
      T <- T1
      for (index in 2:k) {
        T <- T + y[index]
      }
      p <- T1 / T
      sum <- sum + p
    }
    sum <- sum / 10000
    result <- result + sum
  }
  result <- result / 200
  y_axis <- append(y_axis, result)
}
plot(x_axis, y_axis)



result <- 0
for (i in 1:200) {
  sum <- 0
  largest_p <- 0
  corresponding_sd <- 0
  for (j in 1:10000) {
    variance <- j / 1000
    sd <- sqrt(variance)
    p <- pnorm(2, 0, sd) - pnorm(1, 0, sd)
    if (p > largest_p) {
      largest_p <- p
      corresponding_sd <- sd
    }
  }
  corresponding_variance <- corresponding_sd^2
  result <- result + corresponding_variance
}
result <- result / 200
result
