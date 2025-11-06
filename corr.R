corr <- function(directory, threshold = 0) {
  source("complete.R")
  comp <- complete(directory)
  
  valid_ids <- comp$id[comp$nobs > threshold]
  cor_values <- numeric()
  files <- list.files(path = directory, full.names = TRUE)
  
  for (i in valid_ids) {
    data <- read.csv(files[i])
    good <- complete.cases(data)
    if (sum(good) > 0) {
      cor_values <- c(cor_values, cor(data$sulfate[good], data$nitrate[good]))
    }
  }
  
  cor_values
}
