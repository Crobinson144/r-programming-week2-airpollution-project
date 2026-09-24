# 🌎 Air Pollution Analysis — Coursera R Programming (Johns Hopkins)

This repository contains my completed programming assignment for the **Air Pollution** project from the [Johns Hopkins University / Coursera Data Science Specialization](https://www.coursera.org/specializations/jhu-data-science).

The project explores fine particulate matter (PM₂.₅) air pollution data from **332 monitoring stations** across the United States.  
All analysis was implemented in **base R**, focusing on reproducibility, code clarity, and proper handling of missing data.

---

## 💡 What this project shows
- Reading and combining structured CSV data using base R.
- Writing and sourcing custom R functions.
- Handling missing values with `na.rm = TRUE` and `complete.cases()`.
- Automating data summaries (means, counts, correlations).

---

## 📂 Project Structure
```
specdata/           – 332 CSV data files (one per monitor)
pollutantmean.R     – Mean sulfate or nitrate level across selected monitors
complete.R          – Count of complete cases per monitor
corr.R              – Sulfate/nitrate correlation for monitors above a completeness threshold
.gitignore          – Excludes temp files and R history
```

---

## ⚙️ Function Examples
Run from the repository folder:

```r
source("pollutantmean.R"); source("complete.R"); source("corr.R")

pollutantmean("specdata", "sulfate", 1:10)
# [1] 4.064128

complete("specdata", 1)
#   id nobs
# 1  1  117

cr <- corr("specdata", 150)
head(cr)
# [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
```

---

## 🧠 Verification
The examples above match the expected outputs in the assignment instructions and were re-run against `specdata/` in September 2026.

## 🧰 Tools
R (base only), RStudio, Git and GitHub.

## 📜 License
Shared for educational and portfolio purposes. Code by @Crobinson144 as part of Johns Hopkins / Coursera R Programming coursework. Dataset provided by Coursera for instructional use.
