corr <- function(directory, threshold = 0) {
  # Correlation between sulfate and nitrate for each monitor whose number of
  # complete observations is greater than `threshold`.
  # Counts complete cases directly, so this file no longer depends on
  # sourcing complete.R from the current working directory.
  files <- list.files(path = directory, pattern = "\\.csv$", full.names = TRUE)
  cor_values <- numeric()
  
  for (f in files) {
    data <- read.csv(f)
    good <- complete.cases(data)
    nobs <- sum(good)
    if (nobs > threshold && nobs > 0) {
      cor_values <- c(cor_values, cor(data$sulfate[good], data$nitrate[good]))
    }
  }
  
  cor_values
}
