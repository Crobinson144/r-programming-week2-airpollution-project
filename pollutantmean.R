pollutantmean <- function(directory, pollutant, id = 1:332) {
  # Only these two pollutant columns exist in the monitor files
  if (!pollutant %in% c("sulfate", "nitrate")) {
    stop("pollutant must be \"sulfate\" or \"nitrate\"")
  }
  
  # Get all file names
  files <- list.files(path = directory, pattern = "\\.csv$", full.names = TRUE)
  
  # Read and combine selected CSV files
  data_list <- lapply(files[id], read.csv)
  combined <- do.call(rbind, data_list)
  
  # Calculate mean of chosen pollutant, ignoring NAs
  mean(combined[[pollutant]], na.rm = TRUE)
}
