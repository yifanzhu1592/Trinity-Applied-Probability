result <- 0
for (i in 1:200) {
  sum <- 0
  for (j in 1:10000) {
    faces <- c(1, 2, 3, 4, 5, 6)
    number_of_rolling <- 0
    while (length(faces) != 0) {
      x = sample(1:6, 1, T);
      faces = faces[faces != x];
      number_of_rolling <- number_of_rolling + 1
    }
    sum <- sum + number_of_rolling
  }
  result <- result + sum / 10000
}
result / 200



k_vector <- c(6, 7, 8, 9, 10)
probability_vector <- c()
for (k in 6:10) {
  result <- 0
  for (i in 1:200) {
    sum <- 0
    for (j in 1:10000) {
      x1 <- sample(1:k, k, F)
      x2 <- sample(1:k, k, F)
      non_are_correct <- 1
      for (p in 1:k) {
        if (x1[p] == x2[p]) {
          non_are_correct <- 0
        }
      }
      sum <- sum + non_are_correct
    }
    result <- result + sum / 10000
  }
  probability_vector <- append(probability_vector, result / 200)
}
plot(k_vector, probability_vector)
