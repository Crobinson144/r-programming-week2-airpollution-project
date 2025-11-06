complete <- function(directory, id = 1:332) {
  files <- list.files(path = directory, full.names = TRUE)
  result <- data.frame(id = integer(), nobs = integer())
  
  for (i in id) {
    data <- read.csv(files[i])
    nobs <- sum(complete.cases(data))
    result <- rbind(result, data.frame(id = i, nobs = nobs))
  }
  
  result
}
