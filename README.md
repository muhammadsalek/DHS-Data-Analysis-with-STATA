markdown
# Demographic and Health Surveys (DHS)
## DHS Data Analysis with STATA

A complete hands-on course on Demographic and Health Survey (DHS) data analysis using STATA.

<div align="center">

[![License](https://img.shields.io/badge/License-MIT-10b981?style=for-the-badge&labelColor=0d1117&logo=opensourceinitiative&logoColor=10b981)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Active%20Research-7c3aed?style=for-the-badge&labelColor=0d1117)](https://github.com)
[![Journal](https://img.shields.io/badge/Output-Q1%20Journal%20Ready-00d4ff?style=for-the-badge&labelColor=0d1117)](https://github.com)

</div>

<div align="center">

![Stata](https://img.shields.io/badge/Stata-1A5276?style=flat-square&logoColor=white)
![R](https://img.shields.io/badge/R_4.2+-276DC3?style=flat-square&logo=r&logoColor=white)
![BDHS](https://img.shields.io/badge/BDHS_2022-Data-00d4ff?style=flat-square&logoColor=white)
![ggplot2](https://img.shields.io/badge/ggplot2-ef4444?style=flat-square&logoColor=white)
![tidyverse](https://img.shields.io/badge/tidyverse-1a73e8?style=flat-square&logo=r&logoColor=white)
![viridis](https://img.shields.io/badge/viridis-color%20scales-10b981?style=flat-square&logoColor=white)

</div>

---

## 📌 Research Project: Unmet Need for Family Planning — Bangladesh

### Association Between Internet Use and Unmet Need for Family Planning among Ever-Married Women in Bangladesh: Evidence from BDHS 2022

This study examines the association between internet use and unmet need for family planning among ever-married women in Bangladesh, using data from the **Bangladesh Demographic and Health Survey (BDHS) 2022**. The analysis integrates spatial mapping at the division level with statistical modeling to identify regional disparities and the role of digital access in reproductive health outcomes.

### Analysis Pipeline
BDHS 2022 Survey Data
│
▼
Preprocessing cleaning · recoding · survey weighting
│
▼
Statistical Analysis logistic regression · odds ratios
(Stata) survey-weighted estimates
│
▼
Spatial Analysis division-level choropleth maps
(R) prevalence mapping
│
▼
Outputs Q1 figures · CSV tables · maps

text

### Key Highlights

| Feature | Details |
|:--------|:--------|
| **Exposure Variable** | Internet use (frequency and access) |
| **Outcome Variable** | Unmet need for family planning |
| **Population** | Ever-married women of reproductive age |
| **Survey Design** | BDHS 2022 complex survey with proper weighting |
| **Spatial Scope** | 8 divisions of Bangladesh |
| **Statistical Method** | Weighted logistic regression · odds ratios · 95% CI |
| **Spatial Method** | Division-level choropleth mapping |
| **Output Format** | 300 DPI publication-ready figures |

---

## 📚 Course: DHS Data Analysis with STATA

### What You'll Learn

| Topic | Description |
|:------|:------------|
| **Import DHS datasets** | Load and manage DHS data in STATA |
| **Understand DHS file structure** | Navigate recode files and variable naming |
| **Variable recoding** | Transform and categorize variables |
| **Missing data handling** | Detect and manage missing values |
| **Survey weights** | Apply DHS sampling weights correctly |
| **svyset** | Declare complex survey design |
| **Weighted descriptive statistics** | Generate population-representative estimates |
| **Cross-tabulation** | Create weighted crosstabs with row/column percentages |
| **Logistic regression** | Run survey-weighted logistic models |
| **Model diagnostics** | Check model fit and assumptions |
| **Publication-ready tables** | Export tables for manuscripts |
| **Manuscript reporting** | Write results following journal guidelines |

### Repository Structure
DHS-Data-Analysis-with-STATA/
│
├── README.md ← You are here
├── slides/ ← Presentation slides
├── stata-code/ ← STATA analysis scripts
│ ├── 01_import.do
│ ├── 02_explore.do
│ ├── 03_recode.do
│ └── 04_analysis.do
├── docs/ ← Documentation
│ ├── variable_dictionary.md
│ └── analysis_guide.md
└── sample-output/ ← Example outputs
├── tables/
└── figures/

text

---

## 🎬 YouTube Playlist

**Salek Data Lab** — Subscribe for weekly DHS tutorials and research methodology videos.

[![YouTube Channel](https://img.shields.io/badge/YouTube-Salek_Data_Lab-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://youtube.com/@salekdatalab)

---

## 👨‍🏫 Authors

### Corresponding Author

**Md Jamal Uddin, Ph.D.**  
Professor, Department of Statistics  
Shahjalal University of Science and Technology (SUST), Sylhet-3114, Bangladesh  
Faculty of Graduate Education, Daffodil International University, Dhaka, Bangladesh  

📞 +8801716972846  
📧 [jamal-sta@sust.edu](mailto:jamal-sta@sust.edu)  
[![ORCID](https://img.shields.io/badge/ORCID-0000--0002--8360--3274-A6CE39?style=flat-square&logo=orcid&logoColor=white)](https://orcid.org/0000-0002-8360-3274)

---

### Co-Author

**Md Salek Miah**  
Research Assistant, Department of Statistics  
Shahjalal University of Science and Technology (SUST), Sylhet-3114, Bangladesh  

📧 [saleksta@gmail.com](mailto:saleksta@gmail.com)  
[![ORCID](https://img.shields.io/badge/ORCID-0009--0005--5973--461X-A6CE39?style=flat-square&logo=orcid&logoColor=white)](https://orcid.org/0009-0005-5973-461X)  
[![GitHub](https://img.shields.io/badge/GitHub-muhammadsalek-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/muhammadsalek)  
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Md_Salek_Miah-0077B5?style=flat-square&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/md-salek-miah/)  
[![Google Scholar](https://img.shields.io/badge/Google_Scholar-oV99NYoAAAAJ-4285F4?style=flat-square&logo=googlescholar&logoColor=white)](https://scholar.google.com/citations?user=oV99NYoAAAAJ)

---

### Affiliation

**Biostatistics, Epidemiology, and Public Health Research Team**  
Department of Statistics  
Shahjalal University of Science and Technology (SUST)  
Sylhet-3114, Bangladesh

---

## 📊 Data Source

| Dataset | Source | Description |
|:--------|:-------|:------------|
| **BDHS 2022** | [DHS Program](https://dhsprogram.com) | Bangladesh Demographic & Health Survey 2022 |
| **Division Shapefile** | Bangladesh Admin Boundaries | 8 Divisions — spatial polygons |

> [!IMPORTANT]
> **DHS datasets are NOT included in this repository.**  
> Please obtain approval and download datasets directly from:  
> [https://dhsprogram.com](https://dhsprogram.com)

---

## 🚀 Quick Start

### Requirements

- **Stata** ≥ 15
- **R** ≥ 4.2 (for spatial analysis)

### Step 1 — Statistical Analysis (Stata)

```stata
cd "/path/to/DHS-Data-Analysis-with-STATA"
do stata-code/01_import.do
do stata-code/02_explore.do
do stata-code/03_recode.do
do stata-code/04_analysis.do
Step 2 — Spatial Figures (R)
r
# Install required packages
packages <- c(
  "sf",           # spatial vector data handling
  "readxl",       # read Excel files
  "dplyr",        # data manipulation
  "stringr",      # string operations
  "janitor",      # data cleaning utilities
  "ggplot2",      # core visualization
  "ggspatial",    # spatial ggplot2 extensions
  "ggtext",       # rich text in ggplot2
  "tmap",         # thematic maps
  "spdep",        # spatial dependence & autocorrelation
  "spatialreg",   # spatial regression models
  "rmapshaper",   # simplify spatial geometries
  "viridis",      # accessible color scales
  "classInt",     # class interval methods
  "patchwork",    # combine multiple ggplots
  "tidyverse"     # complete data science toolkit
)

installed <- packages %in% rownames(installed.packages())
if (any(!installed)) {
  install.packages(packages[!installed], dependencies = TRUE)
}
invisible(lapply(packages, library, character.only = TRUE))

source("spatial_figures.R")
📈 Research Impact
Domain	Contribution
Reproductive Health	Examines digital determinants of family planning uptake
Spatial Epidemiology	Maps geographic disparities in unmet need across divisions
Public Health	Evidence for SDG 3 — Universal Health Coverage monitoring
Health Policy	Actionable insights for targeted interventions in Bangladesh
📝 Citation
bibtex
@article{miah_uddin_unmet_need_2025,
  title   = {Association Between Internet Use and Unmet Need for Family Planning
             among Ever-Married Women in Bangladesh: Evidence from BDHS 2022},
  author  = {Miah, Md Salek and Uddin, Md Jamal},
  journal = {[Journal Name]},
  year    = {2025},
  note    = {Q1 Journal Submission},
  url     = {https://github.com/muhammadsalek/DHS-Data-Analysis-with-STATA}
}
📄 License
MIT License — Copyright (c) 2025 Md Salek Miah & Md Jamal Uddin

Open for academic research. Citation required for publication use.

⭐ Support
If this repository helped your research, please consider:

⭐ Starring this repository

🍴 Forking for your own use

🔗 Sharing with colleagues

📧 Contacting us for collaborations

<div align="center">
Biostatistics, Epidemiology, and Public Health Research Team
Department of Statistics · Shahjalal University of Science and Technology · Sylhet-3114, Bangladesh

https://img.shields.io/badge/Made%2520with-Stata-1A5276?style=flat-square&logoColor=white
https://img.shields.io/badge/Made%2520with-R-276DC3?style=flat-square&logo=r&logoColor=white
https://img.shields.io/badge/Data-BDHS%25202022-00d4ff?style=flat-square
https://img.shields.io/badge/University-SUST%2520Bangladesh-f59e0b?style=flat-square

⭐ Star this repo if it helped your research!

</div> ``
