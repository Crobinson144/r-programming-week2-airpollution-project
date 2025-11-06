## ======================= run_all.R =======================

cat("R version:", R.version.string, "\n")
cat("Working dir:", getwd(), "\n\n")

## ---- sanity: does specdata exist here? ----
if (!dir.exists("specdata")) {
  stop("Didn't find a 'specdata' folder in this directory.\n",
       "Set the working directory to the parent that contains 'specdata/'.")
}
csv_count <- length(list.files("specdata", pattern="\\.csv$", ignore.case=TRUE))
cat("specdata CSVs:", csv_count, "\n\n")

## ---- source your functions ----
must_source <- function(f) {
  if (!file.exists(f)) stop("Missing required script: ", f)
  source(f)
  cat("Sourced:", f, "\n")
}
must_source("pollutantmean.R")
must_source("complete.R")
must_source("corr.R")
cat("\n")

## ========================================================
## PART 1  (pollutantmean)
## ========================================================
cat("=== PART 1: pollutantmean =============================\n")
cat("Q1 demo:\n")
print(round(pollutantmean("specdata", "sulfate", 1:10), 3))

cat("Q2 demo:\n")
print(round(pollutantmean("specdata", "nitrate", 70:72), 3))

cat("Q3 demo:\n")
print(round(pollutantmean("specdata", "sulfate", 34), 3))

cat("Q4 demo (all nitrate across all files):\n")
print(round(pollutantmean("specdata", "nitrate"), 3))
cat("\n")

## ========================================================
## PART 2  (complete)
## ========================================================
cat("=== PART 2: complete ==================================\n")
cat("Q5 demo:\n")
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cat("Q6 demo:\n")
cc <- complete("specdata", 54)
print(cc$nobs)

cat("Q7 demo (reproducible sample of nobs):\n")
RNGversion("3.5.1"); set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
cat("\n")

## ========================================================
## PART 3  (corr)
## ========================================================
cat("=== PART 3: corr ======================================\n")

cat("Basic checks:\n")
cr_all <- corr("specdata")
cat("length(corr('specdata')):\n"); print(length(cr_all))
cat("summary(corr('specdata')):\n"); print(summary(cr_all))

cat("\nQ8 demo (sorted, sample 5, rounded 4 d.p.):\n")
cr <- sort(cr_all)
RNGversion("3.5.1"); set.seed(868)
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cat("\nQ9 demo (threshold = 129):\n")
cr <- sort(corr("specdata", 129))
n <- length(cr)
RNGversion("3.5.1"); set.seed(197)
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cat("\nQ10 demo (two thresholds, report length at 2000 then values at 1000):\n")
cr_len <- length(corr("specdata", 2000))
cr <- sort(corr("specdata", 1000))
print(c(cr_len, round(cr, 4)))

cat("\nAll checks complete.\n")
## ===================== end run_all.R =====================
