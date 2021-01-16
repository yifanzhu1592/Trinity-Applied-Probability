result <- 0
for (i in 1:200) {
  sum <- 0
  for (j in 1:10000) {
    x1 = sample(1:100000, 1, T);
    x2 = sample(1:100000, 1, T);
    if (coprime(x1, x2)) {
      sum <- sum + 1
    }
  }
  result <- result + sum / 10000
}
result / 200
