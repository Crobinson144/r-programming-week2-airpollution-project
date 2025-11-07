cat > README.md << 'EOF'
# 🌎 Air Pollution Analysis — Coursera R Programming (Johns Hopkins)

This repository contains my completed programming assignment for the **Air Pollution** project from the [Johns Hopkins University / Coursera Data Science Specialization](https://www.coursera.org/specializations/jhu-data-science).

The project explores fine particulate matter (PM₂.₅) air pollution data from **332 monitoring stations** across the United States.  
All analysis was implemented in **base R**, focusing on reproducibility, code clarity, and proper handling of missing data.

---

## 💡 Summary for Recruiters
This project demonstrates:
- Reading and combining structured CSV data using base R.
- Writing and sourcing custom R functions.
- Handling missing values with `na.rm = TRUE`.
- Automating data summaries (means, counts, correlations).
- Reproducible file structure and Git version control.

All scripts (`pollutantmean.R`, `complete.R`, `corr.R`) were verified against Coursera’s autograder and produce identical outputs.

---

## 📂 Project Structure
specdata/           – 332 CSV data files  
pollutantmean.R     – Calculates mean pollutant levels  
complete.R          – Counts complete cases per monitor  
corr.R              – Computes correlations between sulfate & nitrate  
.gitignore          – Excludes temp files and R history  

---

## ⚙️ Function Examples
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

🧠 Verification

All outputs match Coursera’s expected results.
The repository is fully reproducible — anyone with specdata/ can source the scripts and obtain identical results.

🧠 Verification

All outputs match Coursera’s expected results.
The repository is fully reproducible — anyone with specdata/ can source the scripts and obtain identical results.

🧰 Tools

R (Base only)

RStudio Desktop (Windows)

Git & GitHub via SSH

📜 License

This work is shared for educational and portfolio purposes.
All code authored by @Crobinson144 as part of Johns Hopkins / Coursera R Programming coursework.
Dataset provided by Coursera for instructional use.

“Clean, reproducible code is the best resume.”
EOF


---

